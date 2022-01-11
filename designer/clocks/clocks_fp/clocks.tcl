open_project -project {C:\Users\m.syed\Documents\Projects\SF2_FG\ClockTesting\designer\clocks\clocks_fp\clocks.pro}
enable_device -name {M2S010} -enable 1
set_programming_file -name {M2S010} -file {C:\Users\m.syed\Documents\Projects\SF2_FG\ClockTesting\designer\clocks\clocks.ppd}
set_programming_action -action {PROGRAM} -name {M2S010} 
run_selected_actions
save_project
close_project
