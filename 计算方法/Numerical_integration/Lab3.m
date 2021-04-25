clc;
clear;

addpath('../simplification_of_Matrix/');


bound = input('请根据[a,b]输入积分上下限，a为下限，b为上限\n');
epsilon = input('请输入精度要求epsilon \n');
s=input('请输入函数表达式(默认变量为x)：y = \n','s');
y = matlabFunction(str2sym(s));

result = Romberg(y,bound,epsilon);

disp(result);


