vlib questa_lib/work
vlib questa_lib/msim

vlib questa_lib/msim/xil_defaultlib
vlib questa_lib/msim/xpm

vmap xil_defaultlib questa_lib/msim/xil_defaultlib
vmap xpm questa_lib/msim/xpm

vlog -work xil_defaultlib -64 -sv "+incdir+../../../../hack.srcs/sources_1/ip/vio_0/hdl/verilog" "+incdir+../../../../hack.srcs/sources_1/ip/vio_0/hdl" "+incdir+../../../../hack.srcs/sources_1/ip/vio_0/hdl/verilog" "+incdir+../../../../hack.srcs/sources_1/ip/vio_0/hdl" \
"D:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"D:/Xilinx/Vivado/2018.2/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 "+incdir+../../../../hack.srcs/sources_1/ip/vio_0/hdl/verilog" "+incdir+../../../../hack.srcs/sources_1/ip/vio_0/hdl" "+incdir+../../../../hack.srcs/sources_1/ip/vio_0/hdl/verilog" "+incdir+../../../../hack.srcs/sources_1/ip/vio_0/hdl" \
"../../../../hack.srcs/sources_1/ip/vio_0/sim/vio_0.v" \


vlog -work xil_defaultlib \
"glbl.v"

