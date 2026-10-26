"""
Translate-only Verilog generation for VectorCGRA.

This script replicates the DUT construction of selected tests in
cgra/test/CgraRTL_test.py, but only runs the PyMTL3 translation pass
(no Verilator co-simulation import). This avoids the Verilator-4.x-only
`*-classes.mk` glue used by VerilogVerilatorImportPass, so it works with
any Verilator version (or none installed at all).

Two backends are supported:
  - verilog: the stock Verilog/SystemVerilog backend (what --test-verilog
    uses); emits struct typedefs and unpacked-array struct ports that
    Verilator accepts but the Yosys frontend does not.
  - yosys: the PyMTL3 Yosys-compatible backend (what --test-yosys-verilog
    uses); scalarizes struct/array ports into plain logic vectors so the
    output can be read by `yosys read_verilog -sv` directly.

Usage (run from this build/ directory):
  python3 gen_verilog.py <config> <backend>
where <config> is one of: 2x2, 4x4 and <backend> is verilog or yosys.

The generated Verilog is written to the current working directory, one
file per config/backend, named via <Pass>.explicit_file_name.
"""

import os
import re
import sys

REPO_ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
# The repo root itself has an __init__.py, so it is a package named after the
# directory (vectorcgra). Put the repo's parent on sys.path and import
# through the package name, exactly like pytest does when collecting tests.
sys.path.insert(0, os.path.dirname(REPO_ROOT))

from pymtl3.passes.backends.verilog import (
    VerilogTranslationPass,
    VerilogPlaceholderPass,
)
from pymtl3.passes.backends.yosys import YosysTranslationPass
from pymtl3.datatypes import Bits, is_bitstruct_inst
from pymtl3.passes.backends.verilog.errors import VerilogTranslationError
from pymtl3.passes.rtlir import RTLIRDataType as rdt
from pymtl3.passes.rtlir import RTLIRType as rt
from pymtl3.passes.rtlir import BehavioralRTLIR as bir

from vectorcgra.cgra.test.CgraRTL_test import init_param
from vectorcgra.fu.single.AdderRTL import AdderRTL
from vectorcgra.fu.single.GrantRTL import GrantRTL
from vectorcgra.fu.single.CompRTL import CompRTL
from vectorcgra.fu.single.LogicRTL import LogicRTL
from vectorcgra.fu.single.MemUnitRTL import MemUnitRTL
from vectorcgra.fu.single.MulRTL import MulRTL
from vectorcgra.fu.single.PhiRTL import PhiRTL
from vectorcgra.fu.single.RetRTL import RetRTL
from vectorcgra.fu.single.SelRTL import SelRTL
from vectorcgra.fu.single.ShifterRTL import ShifterRTL
from vectorcgra.fu.vector.VectorAdderComboRTL import VectorAdderComboRTL
from vectorcgra.fu.vector.VectorMulComboRTL import VectorMulComboRTL

# Same scalar FU list as test_homogeneous_2x2_ctrl_count_2 in
# cgra/test/CgraRTL_test.py.
SCALAR_FULIST = [
    AdderRTL,
    MulRTL,
    LogicRTL,
    ShifterRTL,
    PhiRTL,
    CompRTL,
    GrantRTL,
    MemUnitRTL,
    SelRTL,
    RetRTL,
]

# Same vector FU list as test_vector_mesh_4x4 in cgra/test/CgraRTL_test.py.
VECTOR_FULIST = [
    AdderRTL,
    MulRTL,
    LogicRTL,
    ShifterRTL,
    PhiRTL,
    CompRTL,
    GrantRTL,
    MemUnitRTL,
    SelRTL,
    VectorMulComboRTL,
    VectorAdderComboRTL,
]


def _escape_braces(s):
    """Escape literal braces so downstream str.format() leaves them alone."""
    return s.replace("{", "{{").replace("}", "}}")


def install_yosys_backend_patches():
    """Fix an upstream bug in the PyMTL3 Yosys backend.

    YosysBehavioralRTLIRToVVisitorL3.visit_Attribute stores a rendered
    struct literal (e.g. "{32'd0, 1'd0, 1'd0, 1'd0}") directly into
    node.sexpr['s_attr'], which signal_expr_epilogue() later feeds to
    str.format(). The literal braces are then parsed as format fields and
    translation dies with e.g. KeyError: "32'd0, 1'd0, 1'd0, 1'd0".

    The fix escapes the braces at the assignment point so that .format()
    renders them back verbatim. This mirrors the class's own handling of
    intended format fields ('__{}'), which remain untouched.

    Two store sites concatenate rendered struct literals into
    node.sexpr['s_attr']: YosysBehavioralRTLIRToVVisitorL1.visit_Attribute
    and YosysBehavioralRTLIRToVVisitorL3.visit_Attribute. Both are
    replaced with brace-escaping copies below. Escaping must happen at
    the store sites (not inside _struct_instance, whose internal
    recursion for nested structs must stay unescaped, and not in
    signal_expr_epilogue, which must keep .format() semantics for the
    '__{}' attribute/index fields).
    """
    from pymtl3.passes.backends.yosys.translation.behavioral. \
        YosysBehavioralTranslatorL1 import YosysBehavioralRTLIRToVVisitorL1
    from pymtl3.passes.backends.yosys.translation.behavioral. \
        YosysBehavioralTranslatorL3 import YosysBehavioralRTLIRToVVisitorL3

    visitor_cls = YosysBehavioralRTLIRToVVisitorL3
    orig_visit_Attribute = visitor_cls.visit_Attribute

    def visit_Attribute(s, node):
        if isinstance(node.value.Type, rt.Signal):
            if isinstance(node.value.Type, rt.Const):
                try:
                    obj = node.Type.get_object()
                except AttributeError:
                    obj = None
                if obj is None:
                    raise VerilogTranslationError(
                        s.blk, node,
                        f"attribute ({node.attr}) of constant struct "
                        f"instance ({node.value}) is not supported!")
                else:
                    if isinstance(obj, Bits):
                        s.signal_expr_prologue(node)
                        node.sexpr['s_attr'] = \
                            s._literal_number(obj.nbits, int(obj))
                        node.sexpr["s_index"] = ""
                        attr = node.attr
                        return s.signal_expr_epilogue(node, f"{attr}")
                    elif is_bitstruct_inst(obj):
                        s.signal_expr_prologue(node)
                        # Upstream stores the raw struct literal here; the
                        # braces must be escaped because s_attr is later
                        # used as a str.format() template.
                        node.sexpr['s_attr'] = _escape_braces(
                            s._struct_instance(node.Type.get_dtype(), obj))
                        node.sexpr["s_index"] = ""
                        attr = node.attr
                        return s.signal_expr_epilogue(node, f"{attr}")
                    else:
                        raise VerilogTranslationError(
                            s.blk, node,
                            f"attribute ({node.attr}) of constant struct "
                            f"instance ({node.value}) is not supported!")

            elif isinstance(node.value.Type.get_dtype(), rdt.Struct):
                value = s.visit(node.value)
                s.signal_expr_prologue(node)
                attr = node.attr
                s.check_res(node, attr)
                node.sexpr['s_attr'] += "__{}"
                node.sexpr['attr'].append(attr)
                return s.signal_expr_epilogue(node, f"{value}.{attr}")

        # Fall-through: delegate to the original method, whose own
        # isinstance checks fail the same way and end in its
        # super().visit_Attribute(node) call. This cannot recurse into the
        # constant-struct branches patched above.
        return orig_visit_Attribute(s, node)

    visitor_cls.visit_Attribute = visit_Attribute

    # --- Patch 2: same brace bug in the L1 visitor (no super() call in
    # the original, so a full replacement is safe) ---
    l1_cls = YosysBehavioralRTLIRToVVisitorL1

    def visit_Attribute_l1(s, node):
        s.signal_expr_prologue(node)
        Type = node.Type
        if isinstance(Type, rt.Const):
            obj = Type.get_object()
            if isinstance(obj, int):
                nbits = node.Type.get_dtype().get_length()
                node.sexpr['s_attr'] = f"{nbits}'d{obj}"
                node.sexpr['s_index'] = ""
            elif isinstance(obj, Bits):
                nbits = node.Type.get_dtype().get_length()
                value = int(obj)
                node.sexpr['s_attr'] = f"{nbits}'d{value}"
                node.sexpr['s_index'] = ""
            elif is_bitstruct_inst(obj):
                node.sexpr['s_attr'] = _escape_braces(
                    s._struct_instance(node.Type.get_dtype(), obj))
                node.sexpr['s_index'] = ""
            else:
                raise VerilogTranslationError(
                    s.blk, node, f"{node.attr} {obj} is not an integer!")
        elif isinstance(node.value, bir.Base):
            s.check_res(node, node.attr)
            node.sexpr['s_attr'] = "{}"
            node.sexpr['attr'].append(node.attr)
        else:
            raise VerilogTranslationError(
                s.blk, node, "sub-components are not supported at L1")
        return s.signal_expr_epilogue(node, node.attr)

    l1_cls.visit_Attribute = visit_Attribute_l1
    print("[gen_verilog] installed Yosys-backend visit_Attribute brace patches")


def gen(config, backend):
    if config == "2x2":
        topology = "Mesh"
        FuList = SCALAR_FULIST
        kwargs = dict(total_execute_ctrl_count=2)
        out_name = "CgraMesh2x2_homogeneous"
    elif config == "4x4":
        topology = "Mesh"
        FuList = VECTOR_FULIST
        kwargs = dict(x_tiles=4, y_tiles=4, data_bitwidth=32)
        out_name = "CgraMesh4x4_vector"
    else:
        raise ValueError(f"unknown config {config}")

    if backend == "verilog":
        pass_cls = VerilogTranslationPass
    elif backend == "yosys":
        pass_cls = YosysTranslationPass
        install_yosys_backend_patches()
    else:
        raise ValueError(f"unknown backend {backend}")

    out_name = f"{out_name}__{backend}.v"

    th = init_param(topology, FuList, **kwargs)
    th.elaborate()

    th.dut.set_metadata(pass_cls.enable, True)
    th.dut.set_metadata(pass_cls.explicit_file_name, out_name)
    th.apply(VerilogPlaceholderPass())
    th.apply(pass_cls())

    out_path = os.path.abspath(out_name)

    # Upstream bug 2: Python bool constants are rendered as Verilog
    # decimal literals via str(), producing e.g. `1'dFalse`, which the
    # Yosys frontend rejects ("Invalid use of [a-fxz?] in decimal
    # constant") although Verilator silently accepts it. Rewrite them to
    # 1'd0/1'd1 after translation. Only <N>'dTrue / <N>'dFalse tokens are
    # touched.
    with open(out_path) as f:
        src = f.read()
    fixed, n = re.subn(r"(\d+)'d(True|False)",
                       lambda m: f"{m.group(1)}'d{1 if m.group(2) == 'True' else 0}",
                       src)
    if n:
        with open(out_path, "w") as f:
            f.write(fixed)
        print(f"[gen_verilog] rewrote {n} bool literals ('dTrue/'dFalse -> 'd1/'d0)")

    size = os.path.getsize(out_path)
    print(f"[gen_verilog] config={config} backend={backend} -> {out_path} ({size} bytes)")


if __name__ == "__main__":
    if len(sys.argv) != 3:
        print(__doc__)
        sys.exit(1)
    gen(sys.argv[1], sys.argv[2])
