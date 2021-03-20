c = load("lab_test_diode_withR.txt");
d = load("lab_test_diode_noR.txt");
e = load("lab_test_SVDiode_withR.txt");
a = c(1,:);
b = c(2,:);
A = d(1,:);
B = d(2,:);
eu = e(1,:);
ei = e(2,:);


x_i = load('lab_test_dianliu.txt');
i = x_i(1,:);
u = x_i(2,:);


%%%%%%
p1 = figure;
plot(a,b,"-ob");
axis([-1 1 -0.5 80]);
xlabel("U/V");
ylabel("I/mA");
grid on;
grid minor;
box on;
title("设置保护电阻的普通二极管伏安特性曲线");
% f=getframe();
saveas(p1,'设置保护电阻的普通二极管伏安特性曲线.png');

%%%%%%
p2 = figure ;
plot(A,B,"-+r");
axis([-1 1 -0.5 105]);
xlabel("U/V");
ylabel("I/mA");
grid on;
grid minor;
box on;
title("未设置保护电阻的普通二极管伏安特性曲线对比图");
%f=getframe();
saveas(p2,'未设置保护电阻的普通二极管伏安特性曲线对比图.png');

%%%%%%%
p3 = figure ;
plot(a,b,"-o");
hold on;
plot(A,B,"-+");
axis([-1 1 -0.5 105]);
plot(u,i,'-*');
xlabel("U/V");
ylabel("I/mA");
grid on;
grid minor;
box on;
legend('有保护电阻','没有保护电阻', '使用恒流源');
title("设置保护电阻与否的普通二极管伏安特性曲线对比图");
% f=getframe();
saveas(p3,'设置保护电阻与否的普通二极管伏安特性曲线对比图.png');

%%%%%%
p4 = figure;
plot(eu,ei,'-*m');
axis([-6 1.2 -200 200]);
xlabel("U/V");
ylabel("I/mA");
grid on;
grid minor;
box on;
 title("设置保护电阻的稳压管伏安特性曲线");
% f=getframe();
saveas(p4,'设置保护电阻的稳压管伏安特性曲线.png');

p5 = figure;
plot(u,i,'-*c');
axis([-6 1.2 -0.1 200]);
xlabel("U/V");
ylabel("I/mA");
grid on;
grid minor;
box on;
 title("恒流源测量普通二极管的伏安特性曲线");
% f=getframe();
saveas(p5,'恒流源测量普通二极管的伏安特性曲线.png');