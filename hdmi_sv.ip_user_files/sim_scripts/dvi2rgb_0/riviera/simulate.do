transcript off
onbreak {quit -force}
onerror {quit -force}
transcript on

asim +access +r +m+dvi2rgb_0  -L xil_defaultlib -L xpm -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.dvi2rgb_0 xil_defaultlib.glbl

do {dvi2rgb_0.udo}

run 1000ns

endsim

quit -force
