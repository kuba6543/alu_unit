@echo off
rem Wpisz ponizej swoja nazwe pliku i nazwe testbencha
set file=exe_unit_w15
set tb=testbench.sv
set filename=%file%.sv 
set filename_rtl=%file%_rtl.sv

@echo on

iverilog -g2005-sv %filename% %filename_rtl% %tb%>log\iverilog.log

vvp a.out>log\vvp.log

gtkwave testbench.vcd>log\gtk.log

pause