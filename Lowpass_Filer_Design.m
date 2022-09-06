clc
clear

L1=600e-06;
C=10e-06;
L2=150e-06;
R=1.5;
Ts=0.02/800;
kp=0.984105920190842;
kd=6.59449920156203e-05;

%kp=1;
%kd=0;

num_z = [1 0];
sys_z = tf(num_z,1,Ts);

num_p = [1];
%den_p=[L1*L2*C 0 (L1+L1) 0];
den_p = [L1*L2*C (L1*L2)/R (L1+L2) 0];


P0 = tf(num_p,den_p);
P = c2d(P0,Ts,'zoh');

num_c=[(kp*Ts)+kd -kd];
den_c=[Ts 0];
C=tf(num_c,den_c,Ts);


Openloop = series(C,P);
Closeloop = feedback(Openloop,1,-1);

Condition0 = P/(1+(C*P));
Condition = sys_z*Condition0;

num=[1 0 0 0 0 0 0 0 0];
den=[1];
filter=tf((9)*num,den,Ts);

num1=[0 1 0 0 0 0 0 0 0];
filter1=tf((9)*num1,den,Ts);

num2=[0 0 1 0 0 0 0 0 0];
filter2=tf((9)*num2,den,Ts);

num3=[0 0 0 1 0 0 0 0 0];
filter3=tf((9)*num3,den,Ts);

num4=[0 0 0 0 1 0 0 0 0];
filter4=tf((9)*num4,den,Ts);

num5=[0 0 0 0 0 1 0 0 0];
filter5=tf((9)*num5,den,Ts);

num6=[0 0 0 0 0 0 1 0 0];
filter6=tf((9)*num6,den,Ts);

num7=[0 0 0 0 0 0 0 1 0];
filter7=tf((9)*num7,den,Ts);

num8=[0 0 0 0 0 0 0 0 1];
filter8=tf((9)*num8,den,Ts);

filter = 1/filter + 1/filter1 + 1/filter2 + 1/filter3 + 1/filter4 + 1/filter5 + 1/filter6 + 1/filter7 + 1/filter8;





num1=[1 0 0 0 0 0 0 0 0 0 0];
den1= [0 0 0 0 0 0 0 0 0 0 1];
advanced=tf(num1,den1,Ts);


figure (1)
bode(Condition*filter*advanced);
figure (2)
 %subplot 121
%nyquist(Condition);
%subplot 122
nyquist(Condition);
% figure (4)
% nyquist(Condition*filter*1);

% figure (2)
% nyquist(P0);