
clc;
clear;
%由于程序中用到了之前写的三角分解法，因此需要添加路径，前提是解压的时候是一起的，相对路径没有改变
addpath('../simplification_of_Matrix/');
%%
% 这部分是自由函数基族代码
rank = input("请输入你想要拟合的函数族的数量\n");
y_tmp = input("请输入你想要用于拟合的线性无关函数族，默认变量为x，格式为[f1(x),f2(x),...,fn(x)]\n",'s');
TestSet = input("请根据\n[ x_0, y_0;\n  x_1, y_1;\n  ..., ...;\n  x_n, y_n ]\n的格式输入用于拟合的点集\n");
y_handle = matlabFunction(str2sym(y_tmp));%【这个地方就是：先将字符串转化为matlab语句，最外层函数matlabFunction将str2sym的结果转化为可以执行的函数句柄y_handle】
A = LS_Method_randombase(y_handle,rank,TestSet);
disp(A);

%%
% level = input("请输入你想要拟合的多项式阶数\n");
% TestSet = input("请根据\n[ x_0, y_0;\n  x_1, y_1;\n  ..., ...;\n  x_n, y_n ]\n的格式输入用于拟合的点集\n");
% sizeofSet = size(TestSet);
% if sizeofSet(1)<=level 
% %   判断如果输入的点集数量小于等于需要拟合的阶数，就无法通过最小二乘实现这点
%     fprintf(' \n>> WARNING! 提供的点不足以拟合该阶曲线 <<\n\n');
%     return;
% end
% disp(TestSet);
% A = LS_Method(level,TestSet);
% disp(A);

%%
% 往下是生成函数结果图像反馈的代码，自由函数基
Min = min(TestSet(:,1)) - 2;
Max = max(TestSet(:,1)) + 2;
px = Min:0.1:Max;
py = zeros(size(px));
for i = rank:-1:1
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

% %%
% % 往下是生成函数结果图像反馈的代码，
% Min = min(TestSet(:,1)) - 2;
% Max = max(TestSet(:,1)) + 2;
% px = Min:0.1:Max;
% py = zeros(size(px));
% for i = level+1:-1:1
%     py = py.*px + A(i);
% end
% plot(px,py,'-r');
% hold on;
% plot(TestSet(:,1),TestSet(:,2),'*b','linewidth',2);
% hold off;
% grid minor;
% xlabel('$x_i$','interpreter','latex');
% ylabel('$y_i$','interpreter','latex');
% title("拟合的图像");