# Qualification probe only; NOT a benchmark macro.
word_size = 8
num_words = 16
write_size = 8
num_rw_ports = 0
num_r_ports = 1
num_w_ports = 1
tech_name = "freepdk45"
process_corners = ["TT"]
supply_voltages = [1.1]
temperatures = [25]
nominal_corner_only = False
analytical_delay = False
spice_name = "ngspice"
check_lvsdrc = False
route_supplies = False
output_name = "probe_1r1w"
output_path = "/out/probe_1r1w"

use_nix = False

use_specified_corners = [("TT", 1.1, 25)]
load_scales = [1, 2]
slew_scales = [1, 2]
num_sim_threads = 1
