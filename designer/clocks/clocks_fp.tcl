new_project \
         -name {clocks} \
         -location {C:\Users\m.syed\Documents\Projects\SF2_FG\ClockTesting\designer\clocks\clocks_fp} \
         -mode {chain} \
         -connect_programmers {FALSE}
add_actel_device \
         -device {M2S010} \
         -name {M2S010}
enable_device \
         -name {M2S010} \
         -enable {TRUE}
save_project
close_project
