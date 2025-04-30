
## Clock Signals
set_property -dict { PACKAGE_PIN F14   IOSTANDARD LVCMOS33 } [get_ports { clk_in }]; #IO_L13P_T2_MRCC_15 Sch=uclk
create_clock -add -name sys_clk_pin -period 83.333 -waveform {0 41.667} [get_ports { clk_in }];

## Pmod Header JC
set_property -dict { PACKAGE_PIN U15   IOSTANDARD LVCMOS33 } [get_ports { sevenseg[0] }]; #IO_L18P_T2_A12_D28_14 Sch=jc1/ck_io[41]
set_property -dict { PACKAGE_PIN V16   IOSTANDARD LVCMOS33 } [get_ports { sevenseg[1] }]; #IO_L18N_T2_A11_D27_14 Sch=jc2/ck_io[40]
set_property -dict { PACKAGE_PIN U17   IOSTANDARD LVCMOS33 } [get_ports { sevenseg[2] }]; #IO_L15P_T2_DQS_RDWR_B_14 Sch=jc3/ck_io[39]
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { sevenseg[3] }]; #IO_L15N_T2_DQS_DOUT_CSO_B_14 Sch=jc4/ck_io[38]
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { sevenseg[4] }]; #IO_L16P_T2_CSI_B_14 Sch=jc7/ck_io[37]
set_property -dict { PACKAGE_PIN P13   IOSTANDARD LVCMOS33 } [get_ports { sevenseg[5] }]; #IO_L19P_T3_A10_D26_14 Sch=jc8/ck_io[36]
set_property -dict { PACKAGE_PIN R13   IOSTANDARD LVCMOS33 } [get_ports { sevenseg[6] }]; #IO_L19N_T3_A09_D25_VREF_14 Sch=jc9/ck_io[35]

## Configuration options, can be used for all designs
set_property BITSTREAM.CONFIG.CONFIGRATE 50 [current_design]
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
set_property BITSTREAM.CONFIG.SPI_BUSWIDTH 4 [current_design]
set_property CONFIG_MODE SPIx4 [current_design]