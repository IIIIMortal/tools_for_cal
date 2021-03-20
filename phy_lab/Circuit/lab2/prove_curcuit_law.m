clc;
clear;
close all;
data1 = load('origin_IR-R.txt');
data2 = load('origin_Uab-R.txt');

simudataD = load('D_simu.txt');
simudataN = load('N_simu.txt');

Us = 4;
Is = 20/1000;
R = 1:10000;
%%%电压图
p1 = figure;
plot(data1(1,:),data1(2,:),"-ro");
hold on;
plot(simudataD(1,:),simudataD(3,:),'--ks');
hold on;
plot(simudataN(1,:),simudataN(3,:),'--bp');
theoI = 1000*((Us/330+Is)./(1/330+1./R))./R;
plot(R,theoI,'-g','linewidth',1);
axis([0 200 15 35]);
xlabel('R');
ylabel('U_{ab}');
title('U_{ab}-R图（实际，戴维南、诺顿等效）');
grid minor;
legend('$I_R$','$I_{D}$','$I_{N}$','Interpreter','latex');


%hold on;


p2 = figure;
plot(data2(1,:),data2(2,:),"-r+");
hold on;
plot(simudataD(1,:),simudataD(2,:),'--k>');
hold on;
plot(simudataN(1,:),simudataN(2,:),'--bX');
theoU = (Us/330+Is)./(1/330+1./R);
plot(R,theoU,'-g','linewidth',1);
axis([0 200 0 5]);
xlabel('R');
ylabel('I_R');
title('I_R-R图（实际，戴维南、诺顿等效）');
grid minor;
legend('$U_{ab}$','$U_{D}$','$U_{N}$','电路分析理论值','Interpreter','latex');


p3 = figure;
%plot(data1(2,:),data2(2,:),'-ko','LineWidth',1,'markersize',5);
hold on;
%plot(simudataD(3,:),simudataD(2,:),'-r','LineWidth',1);
plot(simudataN(3,:),simudataN(2,:),'-ob','LineWidth',1);
xlabel('I_R');
ylabel('U_{ab}');
grid minor;
legend('实际图像','戴维南等效','诺顿等效');
title('U_{ab}-I_R');

saveas(p1,'p3.png');
saveas(p2,'p4.png');
saveas(p3,'uin.png');