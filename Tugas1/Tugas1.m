clear all;
clc;

s = tf('s')
T = 5;
G = 1/((T*s)+1);

figure(1)
subplot(3,1,1);
impulse(G);
title('Impulse Response');
%Impulse response

subplot(3,1,2);
step(G);
title('Step Response');

subplot(3,1,3);
step(G/s); %Ramp response
title('Ramp Response');

risetime(G);
