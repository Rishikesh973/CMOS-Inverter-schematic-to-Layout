v {xschem version=3.4.3 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
N 50 80 50 110 {
lab=vout}
N 10 50 10 140 {
lab=vin}
N 50 90 120 90 {
lab=vout}
N 50 140 70 140 {
lab=gnd}
N 70 140 70 170 {
lab=gnd}
N 50 170 70 170 {
lab=gnd}
N 50 50 70 50 {
lab=vdd}
N 70 20 70 50 {
lab=vdd}
N 50 20 70 20 {
lab=vdd}
C {sky130_fd_pr/nfet_01v8.sym} 30 140 0 0 {name=M1
L=0.15
W=1
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/ipin.sym} 10 90 0 0 {name=p4 lab=vin}
C {devices/ipin.sym} 50 170 3 0 {name=p3 lab=gnd}
C {devices/opin.sym} 120 90 0 0 {name=p2 lab=vout}
C {sky130_fd_pr/pfet_01v8.sym} 30 50 0 0 {name=M2
L=0.15
W=2
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/ipin.sym} 50 20 1 0 {name=p1 lab=vdd}
