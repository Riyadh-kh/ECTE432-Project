load D:/Xinlinx_Software/Vivado/2018.2/lib/win64.o/librdi_dsp_tcltasks.dll
cd {D:/Daily life/UOW/Fourth Year/ECTE432/ECTE432-Project/wavedata}
dsp_wave_convert {Final_Design_Updated.wfv} 
set_param project.waveformStandaloneMode 1
start_gui
current_fileset
dsp_register_design_manager
dsp_open_waveform {Final_Design_Updated.wdb}
open_wave_config {Final_Design_Updated.wcfg}
source D:/Xinlinx_Software/Vivado/2018.2/scripts/sysgen/tcl/SgPaSlaveInterp.tcl
