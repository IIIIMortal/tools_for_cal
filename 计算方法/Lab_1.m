clc;
clear;
close all;
% 
r = input("输入方阵行数 : ");
a = input("输入矩阵 :\n");

% r = 4;
% a = [1 2 3 -4 -2; -3 -4 -12 13 5; 2 10 0 -3 10; 4 14 9 -13 7];
%%
[L,u,x] = Tri_decomposition(a,r);
disp(L);
disp(x);
disp(u);


% result = Gaussian_eli(a,r);
% disp(result);