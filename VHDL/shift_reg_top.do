
# in this file, i am trying my first do file
# shift_reg_top.do file 

quit -sim

#set LIB_DIR "D:/Xilinx/lib_modelsim"
#set IP_DIR "D:/Xilinx/Vivado"

######################################################################
# Create and map a work directory 
if [file exists work] { 
    vdel -all
}
vlib work
vmap work work

vcom shift_reg_left.vhd
vcom shift_reg_right.vhd
vcom shift_reg_top.vhd
vcom shift_reg_top_tb.vhd

vsim -voptargs="+acc" -t ps work.shift_reg_top_tb

add wave d
add wave s_l
add wave dout
add wave dout1

#do shift_reg_top_wave.do

#set IgnoreNote 1
set Resolution ps
set StdArithNoWarnings 1
set NumericStdNoWarnings 1
set MessageFormatNote  "** %S: %R                     Time: %T  \n"
#set MessageFormatWarning  " "
log -r /*

run 20 ms
