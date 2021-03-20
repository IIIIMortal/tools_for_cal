clc;
clear;
close all;

data1k = csvread('curcuit_lab6.csv');
omega = 2*pi*data1k(:,1);

% p0 = figure;
% semilogx(omega,data1k(:,5)./data1k(:,2),'-ro');
% ylabel('$\frac{U_R}{U_S}$','interpreter','latex');
% xlabel('\omega');
% grid minor
% title('$\left|\frac{U_R}{U_S}\right|-\omega$','interpreter','latex');


% p1 = figure;
% %%%%%%%%%    UL  UC  UR
% plot(omega,data1k(:,3),'-ro',omega,data1k(:,4),'-b+',omega,data1k(:,5),'-m^');
% grid minor;
% ylabel('U');
% xlabel('\omega');
% legend('U_L','U_C','U_R');
% title('频率特性曲线');

data1 = csvread('curcuit_lab6_100.csv');
omega2 = 2*pi*data1(:,1);

p2 = figure;

semilogx(omega2,data1(:,3),'-ro',omega,data1k(:,5),'-b+');
hold on
grid minor;
ylabel('U_R');
xlabel('\omega');
legend('R = 100Ω，Q_{理论} = 6.32','R = 1000Ω，Q_{理论} = 0.632');
title('频率特性曲线,compare');

% p = figure;
% plot(omega2,data1(:,3),'-ro');
% ylabel('U_R');
% xlabel('\omega');
% grid minor;
% legend('R = 100Ω');
% title('R = 100Ω时的频率特性');

% p6 = figure;
% plot(omega2,data1(:,3),'-ro',omega2,data1(:,4),'-b^');
% ylabel('U');
% xlabel('\omega');
% grid minor;
% legend('U_R','U_C');
% title('R = 100Ω时的U_R和U_C');


% saveas(p1,'频率特性曲线.png');
saveas(p2,'频率特性曲线比较.png');
% saveas(p,'频率特性曲线，r=100.png');
%saveas(p6,'R = 100Ω时的U_R和U_C.png');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p3 = figure;
f0 = 2570;
f20 = 2550;
U_divUs = [data1k(:,3)./data1k(:,2),data1k(:,4)./data1k(:,2),data1k(:,5)./data1k(:,2)];
eta = data1k(:,1)./f0;
eta2 = data1(:,1)./f20;

plot(eta,U_divUs(:,1),'-ro',eta,U_divUs(:,2),'-b+',eta,U_divUs(:,3),'-m^');
grid minor;
ylabel('U/U_s');
xlabel('\eta');
legend('U_L/U_s','U_C/U_s','U_R/U_s');
title('U/U_s-\eta');
saveas(p3,'U_Us.png');

I1 = data1k(:,5)./1000;
I2 = data1(:,3)./100;
i10 = 1.63/1000;
i20 = 0.85/100;
p4 = figure;
plot(eta,I1./i10,'-r');
hold on;
plot(eta2,I2./i20,'-b');
ylabel('$\frac{I(\omega)}{I_0}$','Interpreter','latex');
xlabel('\eta');
title('通用谐振曲线1,\eta为x');
grid minor;
legend('Q_1,R = 1000\Omega','Q_2,R = 100\Omega');

p5 = figure;
semilogx(data1k(:,1),I1./i10,'-r');
hold on;
semilogx(data1(:,1),I2./i20,'-b');
ylabel('$\frac{I(\omega)}{I_0}$','Interpreter','latex');
xlabel('\omega');
title('通用谐振曲线2,log\omega');
grid minor;
legend('Q_1,R = 1000\Omega','Q_2,R = 100\Omega');
saveas(p5,'Q_influence.png');