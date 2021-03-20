clc;
clear;
close all;

d = load('data.txt');
c = 2*d(:,1)*0.01./d(:,2)*(10^-6)*100000000/455035;
c_a = sum(c)/15;
fit = polyfit(d(:,2)*10^-6,d(:,1)*0.01,1);
p1 = figure;
plot(d(:,2)*(10^-6),d(:,1)*0.01,'or');
hold on;
m = d(:,2)*10^-6;
plot(m,fit(1)*m+fit(2),'--b');

k=sprintf('s2-s1 = %.3f(t2-t1)+%.3f',fit(1),fit(2));
text(m(3),d(2,1)*0.01,k);
grid minor;
xlabel('$\Delta t$','interpreter','latex');
ylabel('$\Delta s$','interpreter','latex');
title('Delta s-Denta t');
