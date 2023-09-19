read_liberty /mnt/volume_nyc1_01/skywater-pdk/libraries/sky130_fd_sc_hd/latest/timing/sky130_fd_sc_hd__ss_n40C_1v60.lib
read_verilog aesEncCore_gl.v
link_design aesEncCore
create_clock -name clk -period 24 {clk}
report_checks
report_power
exit
