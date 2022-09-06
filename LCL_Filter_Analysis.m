
clear
clc

L1=600e-06;
C=10e-06;
L2=150e-06;
R=2;

num=[1];
den0=[L1*L2*C 0 (L1+L2) 0];
den=[L1*L2*C (L1*L2)/R (L1+L2) 0];
LCL_filter = tf(num,den);
LCL_filter0 = tf(num,den0);

LCL_filter_z = c2d(LCL_filter,0.02/500,'zoh');
LCL_filter_z0 = c2d(LCL_filter0,0.02/500,'zoh');
s=feedback(LCL_filter,1,-1);
%bode(LCL_filter0);
hold on
bode(LCL_filter);
%figure (2)
% bode(LCL_filter);
% figure (3)
%rlocus(LCL_filter);
