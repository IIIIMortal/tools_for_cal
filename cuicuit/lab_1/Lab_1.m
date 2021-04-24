clc;
clear;
close all;

c = 0:0.1:9;
data = csvread('circuit_lab_1.csv');
C = data(:,1);
U = data(:,2);
I = data(:,3);
P = data(:,4);
lambda = data(:,5);

a_uc = polyfit(C,U,2);
a_pc = polyfit(C,P,1);
a_ic = polyfit(C,I,2);
a_i2c = polyfit(C,I.^2,2);
a_lc = polyfit(C,lambda,2);
a_i2c2 = polyfit(C,I.^2-0.1296,2);
%%
p1 = figure;
y = sprintf("U = %.2f C^2 + %.2f C + %.2f",a_uc(1),a_uc(2),a_uc(3));
plot(C,U,':b');
hold on;
text(3,220.5,y);
plot(c,a_uc(1)*c.^2+a_uc(2)*c+a_uc(3),'-b');
title('C-U');
xlabel('$$C/\mu F$$','interpreter', 'latex');
ylabel('$$U/V$$','interpreter','latex');
grid minor;
saveas(p1,'CU.png');

%%
p2 = figure;
plot(C,I,':r');
hold on;
y = sprintf("I = %.2f C^2 + %.2f C + %.2f",a_ic(1),a_ic(2),a_ic(3));
text(2,0.35,y);
plot(c,a_ic(1)*c.^2+a_ic(2)*c+a_ic(3),'-r');
title('C-I');
xlabel('$$C /\mu F$$','interpreter', 'latex');
ylabel('$$I/A$$','interpreter','latex');
grid minor;
saveas(p2,'CI.png');

%%
p0 = figure;
plot(C,I.^2,':r');
hold on;
y = sprintf("I^2 = %.2f C^2 + %.2f C + %.2f",a_i2c(1),a_i2c(2),a_i2c(3));
 text(2,0.1,y);
plot(c,a_i2c(1)*c.^2+a_i2c(2)*c+a_i2c(3),'-r');
title('$$C-I^2$$','interpreter','latex');
xlabel('$$C /\mu F$$','interpreter', 'latex');
ylabel('$$I^2/A^2$$','interpreter','latex');
grid minor;
saveas(p0,'CI2.png');

%%
p3 = figure;
plot(C,P,':b');
hold on;
y = sprintf("P = %.2f C + %.2f",a_pc(1),a_pc(2));
text(3,37,y);
plot(c,a_pc(1)*c+a_pc(2),'-b');
title('C-P');
xlabel('$$C /\mu F$$','interpreter', 'latex');
ylabel('$$P/Watt$$','interpreter','latex');
grid minor;
saveas(p3,'CP.png');

%%
p4 = figure;
plot(C,lambda,':g');
hold on;
y = sprintf("lambda = %.2f C^2 + %.2f C + %.2f",a_lc(1),a_lc(2),a_lc(3));
text(2,0.5,y);
plot(c,a_lc(1)*c.^2+a_lc(2)*c+a_lc(3),'-g');
title('$$\cos\varphi-C$$','interpreter','latex');
xlabel('$$C /\mu F$$','interpreter', 'latex');
ylabel('$$\cos\varphi$$','interpreter','latex');
grid minor;
saveas(p4,'Cphi.png');



