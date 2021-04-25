
clc;
clear;
addpath('../simplification_of_Matrix/');

level = input("请输入你想要拟合的多项式阶数\n");
TestSet = input("请根据\n[ x_0, y_0;\n  x_1, y_1;\n  ..., ...;\n  x_n, y_n ]\n的格式输入用于拟合的点集\n");
sizeofSet = size(TestSet);
if sizeofSet(1)<=level
    fprintf(' \n>> WARNING! 提供的点不足以拟合该阶曲线 <<\n\n');
    return;
end
% disp(TestSet);
A = LS_Method(level,TestSet);

disp(A);

%%
Min = min(TestSet(:,1)) - 2;
Max = max(TestSet(:,1)) + 2;
px = Min:0.1:Max;
py = zeros(size(px));
for i = level+1:-1:1
    py = py.*px + A(i);
end
plot(px,py,'-r');
hold on;
plot(TestSet(:,1),TestSet(:,2),'*b','linewidth',2);
hold off;
grid minor;
xlabel('$x_i$','interpreter','latex');
ylabel('$y_i$','interpreter','latex');
title("拟合的图像");