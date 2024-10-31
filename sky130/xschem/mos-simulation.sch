v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
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
N 290 -290 310 -290 {
lab=#net3}
N 230 -290 230 -270 {
lab=#net4}
N 230 -210 350 -210 {
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
lab=#net5}
N 350 -210 420 -210 {
lab=GND}
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
C {vsource.sym} 560 -290 0 0 {name=VDS value="DC \{1.8/2V\}" savecurrent=false}
C {vsource.sym} 260 -290 1 0 {name=VGSDC value="DC \{VGS\}" savecurrent=false}
C {vsource.sym} 230 -240 0 0 {name=VGSAC value="AC 1V" savecurrent=false}
C {devices/simulator_commands_shown.sym} 0 -540 0 0 {name=TransitFrequency
simulator=xyce
only_toplevel=false 
value="
.param VGS=0.9V
.param VTH=0.538V
vvgnd GND 0 dc 0
* Inspired by 
* https://www.reddit.com/r/AskElectronics/comments/1roz6h/how_should_i_setup_a_simulation_to_plot_the/
.ac dec 10 1 1e12 
.step VGS -0.1V 1.8V 0.01V
.measure AC TransitFrequency FIND \{IM(VIDS)/IM(VIGS)\} AT=1
.measure AC VOV EQN \{VGS - VTH\}
.measure AC GmOverIDS EQN \{1/VOV\}
.print ac format=csv file=transit_frequency.csv VOV GmOverIDS TransitFrequency"}
C {vsource.sym} 490 -350 1 0 {name=VIDS value="DC 0V" savecurrent=false}
C {vsource.sym} 340 -290 3 0 {name=VIGS value="DC 0V" savecurrent=false}
