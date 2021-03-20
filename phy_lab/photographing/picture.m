clc;
clear;
close all;
data = csvread('data.csv');
v = zeros(11,2);
a = zeros(10,2);
average_v = zeros(2,1);
average_a = zeros(2,1);
tv = 1:11;
t = 1:12;
for i = 1:11
    v(i,:) = data(i+1,:)-data(i,:);
end
average_v = sum(v)./11;

for j = 1:10
    a(j,:) = v(j+1,:)-v(j,:);
end
average_a = sum(a)./10;
ua = sqrt(sum((a(:,2)-average_a(2)).^2)/90);
ub = 0.5/sqrt(3);
uc = sqrt(ua^2+ub^2)
%%
p1 = figure;
plot(v(:,1),'r^');
grid minor;
xlabel('时间 t/T');
ylabel('水平运动速度V_x(cm/T)');
title('$V_x - t$','interpreter','latex');
text(2,6.4,'$\bar v_x = 6.6(cm/T)$','interpreter','latex');
legend('V_x(cm/T)');
%%
p2 = figure;
plot(v(:,2),'b^');
grid minor;
xlabel('时间 t/T');
ylabel('垂直运动速度V_y(cm/T)');
title('$V_y - t$','interpreter','latex');
legend('V_y(cm/T)');
%%
p3 = figure;
plot(data(:,1),'--r^');
grid minor;
xlabel('时间 t/T');
ylabel('水平位移x(cm/T)');
title('$x - t$','interpreter','latex');
legend('x(cm/T)');
%%
p4 = figure;
plot(data(:,2),'--b^');
grid minor;
xlabel('时间 t/T');
ylabel('垂直位移y(cm/T)');
title('$y - t$','interpreter','latex');
legend('y(cm/T)');
%%
p5 = figure;
plot(data(:,1),data(:,2),'--ro');
grid minor;
xlabel('水平位移x(cm/T)');
ylabel('垂直位移y(cm/T)');
title('$y - x$','interpreter','latex');
legend('y(cm/T)');
%%
p6 = figure;
plot(a(:,2),'ro');
hold on;
axis([1 10 -2.5 -1]);
text(6,-2,'$\bar a = -1.60(cm/T)$','interpreter','latex');
grid minor;
xlabel('时间 t/T');
ylabel('垂直运动加速度a_y(cm/T)');
title('$a_y - t$','interpreter','latex');
legend('a_y(cm/T)');
%%
saveas(p1,'V_x - t.png');
saveas(p2,'V_y - t.png');
saveas(p3,'x - t.png');
saveas(p4,'y - t.png');
saveas(p5,'y - x.png');
saveas(p6,'a_y - t.png');

%%
sy = polyfit(t,data(:,2),2)
sx = polyfit(t,data(:,1),1)
svy = polyfit(tv,v(:,2),1)
syx = polyfit(data(:,1),data(:,2),2)