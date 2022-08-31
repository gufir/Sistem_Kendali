clear all;
clc;

T = 20;
s = tf('s');
num=1;
den=[T T/16 num];
sys = tf(num,den);

figure(1)
subplot(3,1,1);
step(sys);
title('Step Response');
subplot(3,1,2)
impulse(sys);
title('Impulse Response');
subplot(3,1,3)
step(sys/s);
xlim([0 50]);
title("Ramp response");

%overshoot, risetime dan settling time
s1 = stepinfo(sys);
disp(s1);

%steady state error
[y,t]=step(sys);
sserror=(1-y(end));