clear;
clc;
e = load("e_data.txt");
e_i = e;
x = 1:8;
p = polyfit(x,e_i,0);
p = p*ones(1,10);
X = [0,x,9];
f = figure;

plot(X,p,"--r");
hold on;
plot(x,e_i,"-ob");

title('$e_i$','interpreter','latex');
xlabel("实验次数");
ylabel('$e_i$','interpreter','latex');
legend('e = 1.625','e_i');
axis([0,9,1.2,2]);
grid minor;

saveas(f,'e_avg.png');
