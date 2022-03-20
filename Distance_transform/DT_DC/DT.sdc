###################################################################

# Created by write_sdc on Sat Sep  4 22:14:10 2021

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max slow -max_library slow\
                         -min fast -min_library fast
set_wire_load_model -name tsmc13_wl10 -library slow
create_clock [get_ports clk]  -period 11  -waveform {0 5.5}
