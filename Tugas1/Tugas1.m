clear all;
clc;

s = tf('s')
T = 3;
num = [1]
den = [T num];
sys = tf(num,den)




figure(1)
subplot(3,1,1);
impulse(sys);
title('Impulse Response');
%Impulse response

subplot(3,1,2);
step(sys);
title('Step Response');

subplot(3,1,3);
step(sys/s); %Ramp response
title('Ramp Response');
