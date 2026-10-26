# Candidate macro; admission requires characterization and wrapper verification.
word_size = 128
num_words = 512
write_size = 8
num_rw_ports = 1
num_r_ports = 0
num_w_ports = 0
tech_name = "freepdk45"
process_corners = ["TT"]
supply_voltages = [1.1]
temperatures = [25]
nominal_corner_only = False
analytical_delay = False
spice_name = "ngspice"
check_lvsdrc = False
route_supplies = False
output_name = "sram_1rw_512x128"
output_path = "/out/sram_1rw_512x128"

use_nix = False

use_specified_corners = [("TT", 1.1, 25)]
load_scales = [1, 4, 16, 64]
slew_scales = [1, 4, 16, 64]
num_sim_threads = 1

local_array_size = 32

perimeter_pins = False
