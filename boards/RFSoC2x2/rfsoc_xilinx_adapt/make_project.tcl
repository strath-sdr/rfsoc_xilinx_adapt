# Initialise
set overlay_name "rfsoc_xilinx_adapt"
set design_name "block_design"
set iprepo_dir ./../../ip/iprepo
set git_iprepo_dir ./iprepo

# Create project
file delete -force ./${overlay_name}
create_project ${overlay_name} ./${overlay_name} -part xczu28dr-ffvg1517-2-e
set_property target_language VHDL [current_project]

# Clone rfsoc_radio
file delete -force ./rfsoc_sam
catch {exec git clone https://github.com/strath-sdr/rfsoc_sam}
cd ./rfsoc_sam
catch {exec git checkout tags/v0.3.1}
cd ..

# Clone rfsoc_radio
file delete -force ./rfsoc_radio
catch {exec git clone https://github.com/strath-sdr/rfsoc_radio}
cd ./rfsoc_radio
catch {exec git checkout tags/v0.1.2}
cd ..

# Copy IP Cores
file delete -force ./iprepo
file mkdir ./iprepo
file copy -force ./rfsoc_sam/boards/ip/iprepo/SpectrumAnalyser_v1_1 ./iprepo
file copy -force ./rfsoc_sam/boards/ip/iprepo/xsg_bwselector_v1_1 ./iprepo
file copy -force ./rfsoc_radio/boards/ip/iprepo/inspector_v1_0 ./iprepo

# Set IP repository paths
set_property ip_repo_paths $iprepo_dir [current_project]
set_property ip_repo_paths [concat [get_property ip_repo_paths [current_project]] $git_iprepo_dir] [current_project]
update_ip_catalog

# Add constraints
add_files -fileset constrs_1 -norecurse ./constraints.xdc
