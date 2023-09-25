v {xschem version=3.4.3 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
C {devices/vsource.sym} -520 -100 0 0 {name=Vin value="PULSE(0 1.8 0 0.1n 0.1n 5n 10n 10)"}
C {devices/vsource.sym} -290 -100 0 0 {name=vdd value=1.8}
C {devices/gnd.sym} -180 -150 0 0 {name=l1 lab=GND}
C {devices/gnd.sym} -290 -70 0 0 {name=l2 lab=GND}
C {devices/gnd.sym} -520 -70 0 0 {name=l3 lab=GND}
C {inverter_vtc.sym} -160 60 0 0 {name=x1}
C {devices/lab_pin.sym} -250 -200 0 0 {name=p1 sig_type=std_logic lab=vin}
C {devices/lab_pin.sym} -180 -240 1 0 {name=p2 sig_type=std_logic lab=vdd}
C {devices/lab_pin.sym} -110 -190 2 0 {name=p3 sig_type=std_logic lab=vout}
C {devices/lab_pin.sym} -520 -130 1 0 {name=p4 sig_type=std_logic lab=vin}
C {devices/lab_pin.sym} -290 -130 1 0 {name=p5 sig_type=std_logic lab=vdd}
C {devices/code_shown.sym} -610 -350 0 0 {name=s1 only_toplevel=false value=".lib /usr/local/share/pdk/sky130A/libs.tech/ngspice/sky130.lib.spice tt
.dc vin 0 2 1m
.tran 0.2n 30n
.save all
.end"}
C {devices/capa.sym} -110 -160 0 0 {name=C1
m=1
value=0.2p
footprint=1206
device="ceramic capacitor"}
C {devices/gnd.sym} -110 -130 0 0 {name=l4 lab=GND}
