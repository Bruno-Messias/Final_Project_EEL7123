transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vcom -93 -work work {C:/Users/fehug/Documents/GitHub_local/EEL7123/FA_Alternative/FA_Alternative2.vhd}

