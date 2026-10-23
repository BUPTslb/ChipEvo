# ----------------------------------------
# Jasper Version Info
# tool      : Jasper 2023.09
# platform  : Linux 4.15.0-213-generic
# version   : 2023.09p002 64 bits
# build date: 2023.11.21 13:10:30 UTC
# ----------------------------------------
# started   : 2026-06-14 14:37:42 HKT
# hostname  : linux2.cse.cuhk.edu.hk.cs-world
# pid       : 24557
# arguments : '-label' 'session_0' '-console' '//127.0.0.1:33479' '-nowindow' '-style' 'windows' '-exitonerror' '-data' 'AAACxniclZJPS8NAEMVfEEHEQz+EJ8FsDUpFehC0N0X8g9clpsFKYyOmf8CLfkyPfpP426mFBoS2O2Rmdve9mbfZjSR1P+u6lo2tD1xLV7rWnXr4Gz0SFe3rRIlO1da5ZjrCYuVYrEwTDTS0eZ88ttlZA59siG+vgU/UAZdsoKjJWEdTk7FalY3oZx7VjbQ8otuvRpS2F0AtLRzoUKkKrKSnp/ZIFf4NK/WusXX03Mw96B3QFSsZ+R75E9wxs8HfXsgL8m85uLlhU7KAcNTp4J+JFbGAXbGe0zHR8b+MC/wLSnqaosbpknfi+R54Mx5MqVd2U2M6YoUCR90JrII+ztSnYGd2miGIgM8MPz+Jp3bQ0IczQp2nZmr9wzz8/andxOJsu/oF6JZs7Q==' '-proj' '/research/d7/gds/lbshen24/research/ChipEvo/DR_RTL_compare/ast/build/eda_workspace/jgproject/sessionLogs/session_0' '-init' '-hidden' '/research/d7/gds/lbshen24/research/ChipEvo/DR_RTL_compare/ast/build/eda_workspace/jgproject/.tmp/.initCmds.tcl' '/research/d7/gds/lbshen24/research/ChipEvo/DR_RTL_compare/ast/build/eda_workspace/sec_vending_machine.v1.tcl' '-hidden' '/research/d7/gds/lbshen24/research/ChipEvo/DR_RTL_compare/ast/build/eda_workspace/jgproject/.tmp/.postCmds.tcl'
set DESIGN_NAME_GOLDEN "vending_machine.v0"
set DESIGN_NAME "vending_machine.v1"
set TOP_NAME "vending_machine"


clear -all
check_sec -analyze -spec -sv ./rtl/${DESIGN_NAME_GOLDEN}.v
check_sec -analyze -imp -sv ./rtl/${DESIGN_NAME}.v
check_sec -elaborate -spec -top ${TOP_NAME} -disable_auto_bbox
check_sec -elaborate -imp -top ${TOP_NAME} -disable_auto_bbox
# check_sec -setup clock -infer reset -none
check_sec -setup 
check_sec -map -auto
clock clk 
reset reset
check_sec -gen
# check_sec -prove -strategy design_style -design_style_type clock_gating
# check_sec -prove
check_sec -prove -strategy proof
exit -force
