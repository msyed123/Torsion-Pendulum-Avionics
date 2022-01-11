set_device -family {SmartFusion2} -die {M2S010} -speed {STD}
read_vhdl -mode vhdl_2008 -lib COREDDS_LIB {C:\Users\myles.clark\OneDrive - University of Florida\Desktop\ClockTesting\component\work\COREDDS_C0\COREDDS_C0_0\COREDDS_C0_COREDDS_C0_0_dds_full_cos.vhd}
read_vhdl -mode vhdl_2008 -lib COREDDS_LIB {C:\Users\myles.clark\OneDrive - University of Florida\Desktop\ClockTesting\component\work\COREDDS_C0\COREDDS_C0_0\COREDDS_C0_COREDDS_C0_0_dds_full_sin.vhd}
read_vhdl -mode vhdl_2008 -lib COREDDS_LIB {C:\Users\myles.clark\OneDrive - University of Florida\Desktop\ClockTesting\component\work\COREDDS_C0\COREDDS_C0_0\rtl\vhdl\core\COREDDS_C0_COREDDS_C0_0_dds_g4_lsram.vhd}
read_vhdl -mode vhdl_2008 -lib COREDDS_LIB {C:\Users\myles.clark\OneDrive - University of Florida\Desktop\ClockTesting\component\Actel\DirectCore\COREDDS\3.1.100\rtl\vhdl\core\dds_rtl_pack.vhd}
read_vhdl -mode vhdl_2008 -lib COREDDS_LIB {C:\Users\myles.clark\OneDrive - University of Florida\Desktop\ClockTesting\component\Actel\DirectCore\COREDDS\3.1.100\rtl\vhdl\core\dds_kit.vhd}
read_vhdl -mode vhdl_2008 -lib COREDDS_LIB {C:\Users\myles.clark\OneDrive - University of Florida\Desktop\ClockTesting\component\work\COREDDS_C0\COREDDS_C0_0\rtl\vhdl\core\lut.vhd}
read_vhdl -mode vhdl_2008 -lib COREDDS_LIB {C:\Users\myles.clark\OneDrive - University of Florida\Desktop\ClockTesting\component\Actel\DirectCore\COREDDS\3.1.100\rtl\vhdl\core\dds_module.vhd}
read_vhdl -mode vhdl_2008 -lib COREDDS_LIB {C:\Users\myles.clark\OneDrive - University of Florida\Desktop\ClockTesting\component\work\COREDDS_C0\COREDDS_C0_0\rtl\vhdl\core\DDS_TOP.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\myles.clark\OneDrive - University of Florida\Desktop\ClockTesting\component\work\COREDDS_C0\COREDDS_C0.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\myles.clark\OneDrive - University of Florida\Desktop\ClockTesting\component\work\FCCC_C0\FCCC_C0_0\FCCC_C0_FCCC_C0_0_FCCC.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\myles.clark\OneDrive - University of Florida\Desktop\ClockTesting\component\work\FCCC_C0\FCCC_C0.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\myles.clark\OneDrive - University of Florida\Desktop\ClockTesting\component\work\OSC_C0\OSC_C0_0\OSC_C0_OSC_C0_0_OSC.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\myles.clark\OneDrive - University of Florida\Desktop\ClockTesting\component\work\OSC_C0\OSC_C0.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\myles.clark\OneDrive - University of Florida\Desktop\ClockTesting\hdl\spi_interface_handler.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\myles.clark\OneDrive - University of Florida\Desktop\ClockTesting\hdl\spi_master.vhd}
read_vhdl -mode vhdl_2008 {C:\Users\myles.clark\OneDrive - University of Florida\Desktop\ClockTesting\component\work\clocks\clocks.vhd}
set_top_level {clocks}
map_netlist
read_sdc {C:\Users\myles.clark\OneDrive - University of Florida\Desktop\ClockTesting\constraint\clocks_derived_constraints.sdc}
check_constraints {C:\Users\myles.clark\OneDrive - University of Florida\Desktop\ClockTesting\constraint\synthesis_sdc_errors.log}
write_fdc {C:\Users\myles.clark\OneDrive - University of Florida\Desktop\ClockTesting\designer\clocks\synthesis.fdc}
