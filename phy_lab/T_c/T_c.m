clear;
clc;
close all;
d1 = load('data1.txt');
d2 = load('data2.txt');
p1 = figure;

plot(d1(1,:),d1(2,:),'-ro');
hold on;
plot(d2(1,:),d2(2,:),'-bo');
grid minor;
title('铁氧体样品交流电桥输出电压U与加热温度T关系');
ylabel('输出电压U/mV');
xlabel('加热温度T/°C');
legend('加热过程,f = 1000Hz','降温过程,f = 500Hz')

p2 = figure;
a1= size(d1);
k1 = zeros(1,a1(2));
min1 = 1;
for i = 2:a1(2)
    k1(i) = (d1(2,i)-d1(2,i-1))/(d1(1,i)-d1(1,i-1));
    if k1(i)<k1(min1)
        min1 = i;
    end
end
a2= size(d2);
k2 = zeros(1,a2(2));
min2 = 1;
for i = 2:a2(2)
    k2(i) = (d2(2,i)-d2(2,i-1))/(d2(1,i)-d2(1,i-1));
    if k2(i)<k2(min2)
        min2 = i;
    end
end
plot(d1(1,:),k1,'--r^');
hold on;
plot(d2(1,:),k2,'--b^');
grid minor;
title('U-T图各点斜率');
ylabel('输出电压随温度变化速率 mV/°C');
xlabel('加热温度T/°C');
legend('加热过程1,f = 1000Hz','降温过程2,f = 500Hz');
t = sprintf('T_{C1} = %.1f°C\nT_{C2} = %.1f°C',d1(1,min1),d2(1,min2));
text(25,-4,t);

saveas(p1,'u-t.jpg');
saveas(p2,'k.jpg');
