v {xschem version=3.4.4 file_version=1.2
}
G {}
K {}
V {}
S {}
E {}
T {TODO: CONSERTAR SIMULACAO} 60 -360 0 0 0.4 0.4 {}
N 730 -350 730 -320 {
lab=OUT}
N 640 -290 690 -290 {
lab=IN}
N 620 -220 620 -210 {
lab=#net1}
N 620 -290 620 -280 {
lab=IN}
N 620 -290 640 -290 {
lab=IN}
N 620 -150 730 -150 {
lab=GND}
N 730 -260 730 -150 {
lab=GND}
N 730 -340 760 -340 {
lab=OUT}
N 880 -410 880 -340 {
lab=#net2}
N 480 -410 880 -410 {
lab=#net2}
N 480 -410 480 -380 {
lab=#net2}
N 480 -260 480 -150 {
lab=GND}
N 480 -150 620 -150 {
lab=GND}
N 730 -150 880 -150 {
lab=GND}
N 880 -280 880 -150 {
lab=GND}
N 520 -220 620 -220 {
lab=#net1}
N 520 -290 520 -220 {
lab=#net1}
C {sky130_fd_pr/corner.sym} 50 -220 0 0 {name=CORNER only_toplevel=true corner=tt}
C {sky130_fd_pr/nfet3_01v8.sym} 710 -290 0 0 {name=M1
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
C {gnd.sym} 730 -150 0 0 {name=l1 lab=GND}
C {devices/title.sym} 160 -40 0 0 {name=l2 author="Ivan Pancheniak"}
C {vsource.sym} 620 -250 0 0 {name=VGSAC value="AC 1V" savecurrent=false}
C {devices/simulator_commands_shown.sym} 0 -690 0 0 {name=IntrinsicGain
simulator=xyce
only_toplevel=false 
value="
** Based on https://www.researchgate.net/publication/349482691_Evaluation_of_the_intrinsic_gain_of_submicron_CMOS_transistors_by_using_simulations
.param VTH=0.538V
.param VGS=0.9V
vvgnd GND 0 dc 0
.ac lin 101 1 1k
.step VGS 0V 1.8V 0.01V
.measure AC GMRO FIND \{-V(OUT)/V(IN)\}AT 0.5KHz
.measure AC VOV EQN \{VGS - VTH\}
.measure AC GmOverIDS EQN \{1/VOV\}
.print ac format=csv file=intrinsic_gain.csv GmOverIDS GMRO
.result \{VOV\}
.result \{GmOverIDS\}
.result \{GMRO\}"}
C {isource.sym} 730 -380 0 0 {name=FBIAS value="VREF 1"}
C {lab_pin.sym} 760 -340 2 0 {name=p2 sig_type=std_logic lab=OUT}
C {vsource.sym} 880 -310 0 0 {name=VVDD value="DC 1.8V" savecurrent=false}
C {lab_pin.sym} 670 -290 1 0 {name=p1 sig_type=std_logic lab=IN}
C {vsource.sym} 620 -180 0 0 {name=VGSDC value="DC \{VGS\}" savecurrent=false}
C {sky130_fd_pr/nfet3_01v8.sym} 500 -290 0 1 {name=M2
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
C {vsource.sym} 480 -350 0 0 {name=VREF value="0V" savecurrent=false}
