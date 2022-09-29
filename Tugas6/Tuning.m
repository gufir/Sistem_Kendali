clc;
clear all;

J = 0.01;
b = 0.1;
K = 0.01;
R = 1;
L = 0.5;

L1 = 0.16; % 0.05
T = 0.64-L1; %0.84-0.05

a = K*L1/T
Kp = 1.2*T/L1
Ti = 2*L1
Td = 0.5*L1

Ki=Kp/Ti
Kd=Kp*Td

num_motor = [K];
den_motor = [J*L J*R+b*L R*b+K*K]

motor = tf(num_motor,den_motor)
C = tf([Kd Kp Ki],[1 0]);
complete = feedback(motor*C,1);

step(complete)
stepinfo(complete)
[y,t]=step(complete);
sserror=(1-y(end))