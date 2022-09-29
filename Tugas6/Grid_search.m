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
sys = K/((J*s)*(L*s+R) + K^2)

%Parameter tuning
Kp = [4:5]
Ti = [0.4:0.2:0.6]
Td = [0:0.1:0.2]

hold all
t = [0:0.01:20]
for i=1:length(Kp)
    for j=1:length(Ti)
        for k=1:length(Td)
            cont = Kp(i) + Kp(i)/(s*Ti(j)) + Kp(i)*Td(k)*s
            cl_sys = feedback(cont*sys,1)
            [yc,tc] = step(cl_sys,t)
            plot(tc,yc,'LineWidth',1); xlabel('Time(s)'); ylabel('Amplitude')
        end
    end
end

