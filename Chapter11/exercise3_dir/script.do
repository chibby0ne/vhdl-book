vlib work
vmap work work
vcom -reportprogress 300 -work work *.vhd
vsim work.addr_deco_tb
add wave sim:/addr_deco_tb/*
