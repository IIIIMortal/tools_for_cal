clc;
clear;
% 添加参数
bound = input('请根据[a,b]输入积分上下限，a为下限，b为上限\n');
epsilon = input('请输入精度要求epsilon \n');
k = input('请输入最大二分次数k \n');
s=input('请输入函数表达式(默认变量为x)：y = \n','s');
y = matlabFunction(str2sym(s));

result = Romberg(y,bound,epsilon,k);
% 输出结果
disp(result);


