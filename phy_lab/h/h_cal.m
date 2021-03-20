clc;
clear;
close all;
format long;
data = load('data.txt');
a1 = polyfit(data(1,:),data(2,:),1);
a2 = polyfit(data(1,:),data(3,:),1);
a3 = polyfit(data(1,:),data(4,:),1);
a4 = polyfit(data(1,:),data(5,:),1);
a5 = polyfit(data(1,:),data(6,:),1);
a6 = polyfit(data(1,:),data(7,:),1);
%%
p1 = figure;
plot(data(1,:),data(2,:),'-ro');
hold on;
plot(data(1,:),a1(1).*data(1,:)+a1(2),'--b');
grid minor;
title('$U_a-v$','interpreter','latex');
ylabel('$U_a$','interpreter','latex');
xlabel('$v$','interpreter','latex');
d = sprintf('U_a = %.4f v - %.4f',a1(1),-a1(2));
text(data(1,2)-2,data(2,2),d);
legend('lab result','data fitting result');

%%
p2 = figure;
plot(data(1,:),data(3,:),'-ro');
hold on;
plot(data(1,:),a2(1).*data(1,:)+a2(2),'--b');
grid minor;
title('$U_a-v$','interpreter','latex');
ylabel('$U_a$','interpreter','latex');
xlabel('$v$','interpreter','latex');
d = sprintf('U_a = %.4f v - %.4f',a2(1),-a2(2));
text(data(1,2)-2,data(3,2),d);
legend('lab result','data fitting result');

%%
p3 = figure;
plot(data(1,:),data(4,:),'-ro');
hold on;
plot(data(1,:),a3(1).*data(1,:)+a3(2),'--b');
grid minor;
title('$U_a-v$','interpreter','latex');
ylabel('$U_a$','interpreter','latex');
xlabel('$v$','interpreter','latex');
d = sprintf('U_a = %.4f v - %.4f',a3(1),-a3(2));
text(data(1,2)-2,data(4,2),d);
legend('lab result','data fitting result');

%%
p4 = figure;
plot(data(1,:),data(5,:),'-ro');
hold on;
plot(data(1,:),a4(1).*data(1,:)+a4(2),'--b');
grid minor;
title('$U_a-v$','interpreter','latex');
ylabel('$U_a$','interpreter','latex');
xlabel('$v$','interpreter','latex');
d = sprintf('U_a = %.4f v - %.4f',a4(1),-a4(2));
text(data(1,2)-2,data(5,2),d);
legend('lab result','data fitting result');

%%
p5 = figure;
plot(data(1,:),data(6,:),'-ro');
hold on;
plot(data(1,:),a5(1).*data(1,:)+a5(2),'--b');
grid minor;
title('$U_a-v$','interpreter','latex');
ylabel('$U_a$','interpreter','latex');
xlabel('$v$','interpreter','latex');
d = sprintf('U_a = %.4f v - %.4f',a5(1),-a5(2));
text(data(1,2)-2,data(6,2),d);
legend('lab result','data fitting result');

%%
p6 = figure;
plot(data(1,:),data(7,:),'-ro');
hold on;
plot(data(1,:),a6(1).*data(1,:)+a6(2),'--b');
grid minor;
title('$U_a-v$','interpreter','latex');
ylabel('$U_a$','interpreter','latex');
xlabel('$v$','interpreter','latex');
d = sprintf('U_a = %.4f v - %.4f',a6(1),-a6(2));
text(data(1,2)-2,data(7,2),d);
legend('lab result','data fitting result');

saveas(p1,'set1.png');
saveas(p2,'set2.png');
saveas(p3,'set3.png');
saveas(p4,'set4.png');
saveas(p5,'set5.png');
saveas(p6,'set6.png');

%%
k = [a1(1);a3(1);a4(1);a5(1);a6(1)];
h = 1.6*10^(-19)*10^(-14).*k;
h_a = sum(h)/5;
ua = sqrt(sum((h-h_a).^2)/20);
disp(h);
disp(h_a);
disp(ua);

