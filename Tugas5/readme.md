# Assigment 5
![image](https://user-images.githubusercontent.com/82512652/191258163-954f93b5-d98c-40ca-bd71-8deb2005a3db.png)

Simulate above transfer function using PD (Proportional and Derivative) control system. Please use this feedback gain :
1. P : 1
2. D : (1, 3, 5, 7, 9)

Simulate by using mentioned input :
1. Step
2. Ramp
3. Impulse

And analyze the response based on :
1. Rise time
2. Settling time
3. Overshoot
4. Steady state Error

# Program
1. Clear all digunakan untuk membersihkan name dan value pada workspace, kemudian clc digunakan untuk membersihkan command window dan close all untuk menutup figure.
2. Deklarasi nilai T bebas, num = 1 dan den=[T T/16 1] menyesuaikan persamaan. plant merupakan transfer function dari (num,den).
3. Deklarasi KP dan Kd menyesuaikan soal yaitu Kp = 1 dan Kd = [1 3 5 7 9]
4. Loop pertama digunakan untuk menentukan transfer function system atau sistem PD.
5. Loop Kedua digunakan untuk menampilkan step,impulse dan ramp respon dari transfer function. Dan juga untuk menampilkan Rise Time,Settling Time, Overshoot, serta Steady State Error
