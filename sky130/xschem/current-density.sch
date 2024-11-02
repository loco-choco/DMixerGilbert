v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {TODO: CONSERTAR SIMULACAO} 30 -340 0 0 0.4 0.4 {}
N 420 -260 420 -240 {
lab=GND}
N 560 -350 560 -320 {
lab=#net1}
N 420 -350 420 -320 {
lab=#net2}
N 420 -210 560 -210 {
lab=GND}
N 560 -260 560 -240 {
lab=GND}
N 420 -240 420 -210 {
lab=GND}
N 560 -240 560 -210 {
lab=GND}
N 520 -350 560 -350 {
lab=#net1}
N 420 -350 460 -350 {
lab=#net2}
N 370 -290 380 -290 {
lab=#net3}
N 350 -210 420 -210 {
lab=GND}
N 330 -230 330 -210 {
lab=GND}
N 330 -210 350 -210 {
lab=GND}
N 330 -290 370 -290 {
lab=#net3}
C {sky130_fd_pr/corner.sym} 50 -220 0 0 {name=CORNER only_toplevel=true corner=tt}
C {sky130_fd_pr/nfet3_01v8.sym} 400 -290 0 0 {name=M1
W=1
L=0.3
body=GND
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
C {gnd.sym} 420 -210 0 0 {name=l1 lab=GND}
C {devices/title.sym} 160 -40 0 0 {name=l2 author="Ivan Pancheniak"}
C {vsource.sym} 560 -290 0 0 {name=VDS value="DC \{1.8\}" savecurrent=false}
C {vsource.sym} 330 -260 0 0 {name=VGSDC value="DC \{VGS\}" savecurrent=false}
C {devices/simulator_commands_shown.sym} 0 -630 0 0 {name=CurrentDensity
simulator=xyce
only_toplevel=false 
value="
.param VTH=0.538V
.param VGS=0.9V
.param MOSW=1u
vvgnd GND 0 dc 0

.DC LIN VGS -0.1V 1.8V 0.01V

.measure DC IOVERW EQN \{I(VIDS)/MOSW\}
.measure DC VOV EQN \{VGS - VTH\}
.measure DC GmOverIDS EQN \{1/VOV\}
.print DC format=csv file=current_density.csv VOV GmOverIDS IOVERW"}
C {vsource.sym} 490 -350 1 0 {name=VIDS value="DC 0V" savecurrent=false}
