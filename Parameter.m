
clear
clc

%parameters

Vin=360;
Vg=220*sqrt(2);
Po=6e3;
fo=50;
Vtri=3.05;


L1=600e-06;
C=10e-06;
L2=150e-06;
R=1.5;
Ts=0.02/800;

run("LCL_SIM");

