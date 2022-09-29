clear all
clc()


%Deklarasi Konstanta
J = 0.01
b = 0.1
K = 0.01
R = 1
L = 0.5

%Deklarasi sistem
s = tf('s')
% sys = K/((J*s + b)*(L*s+R) + K^2)
sys = 1/(s^3+3*s^2+3*s)

% Mendapatkan step respon system
[y,t] = step(sys);
plot(t,y,'LineWidth',2);
grid on;
xlabel('Time(s)');
ylabel('Amplitude');
title('Step respon sistem Plant');

%Mendapatkan nilai derivative (perbedaan nilai)
yp = diff(y);
ypp = diff(y,2);

% Menemukan akar menggunakan fzero
t_infl = fzero(@(T) interp1(t(2:end-1),ypp,T,'linear','extrap'),0)
y_infl = interp1(t,y,t_infl,'linear')
hold on;
plot(t_infl,y_infl,'ro');

% Mendapatkan persamaan garis lurus dari inflection point
h = mean(diff(t));
dy = gradient(y, h);
[~,idx] = max(dy);
b = [t([idx-1,idx+1]) ones(2,1)] \ y([idx-1,idx+1]);            % Regression Line Around Maximum Derivative
tv = [-b(2)/b(1); (1-b(2))/b(1)];                               % Independent Variable Range For Tangent Line Plot
f = [tv ones(2,1)] * b;                                         % Calculate Tangent Line

plot(tv, f, '-r','LineWidth',1.5)
ylim([0 max(y)]);

%Mendapatkan nilai T dan L
L = tv(1)
T = tv(2) - tv(1)

% PID parameter tuning-rule ZN1
a = L/T
Kp = 1.2/a
Ti = 2*L
Td = L/2

Kp_1 = 5.4;
Ti_1 = 1.8138;
Td_1 = 0.45345;

%Fungsi Kontroller PID
cont = Kp + Kp/(s*Ti) + Kp*Td*s
cont_1 = Kp_1 + Kp_1/(s*Ti_1) + Kp_1*Td_1*s

%Visualisasi step respon close-loop system
cl_sys = feedback(cont*sys,1);
cl_sys1 = feedback(cont_1*sys,1);
t = [0:0.01:5];
[yc,tc] = step(cl_sys);
[yc1,tc1] = step(cl_sys1);
figure;
plot(tc,yc,'LineWidth',2); xlabel('Time(s)'); ylabel('Amplitude');
title('Metode Tuning Ziegler Nichols - 1');
grid on;
figure;
plot(tc1,yc1,'LineWidth',2); xlabel('Time(s)'); ylabel('Amplitude');
title('Metode Tuning Ziegler Nichols - 2');
grid on;

stepinfo(cl_sys1)
