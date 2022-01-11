set_device -family {SmartFusion2} -die {M2S010} -speed {STD}
read_adl {C:\Users\myles.clark\OneDrive - University of Florida\Desktop\ClockTesting\designer\clocks\clocks.adl}
read_afl {C:\Users\myles.clark\OneDrive - University of Florida\Desktop\ClockTesting\designer\clocks\clocks.afl}
map_netlist
read_sdc {C:\Users\myles.clark\OneDrive - University of Florida\Desktop\ClockTesting\constraint\clocks_derived_constraints.sdc}
check_constraints {C:\Users\myles.clark\OneDrive - University of Florida\Desktop\ClockTesting\constraint\timing_sdc_errors.log}
write_sdc -mode smarttime {C:\Users\myles.clark\OneDrive - University of Florida\Desktop\ClockTesting\designer\clocks\timing_analysis.sdc}
