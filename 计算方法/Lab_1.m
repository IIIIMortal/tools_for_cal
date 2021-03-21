clc;
clear;
close all;

r = input("输入方阵行数 : ");
a = input("输入矩阵 :\n");

% result = Gaussian_eli(a,r);
[L,u,x] = Tri_decomposition(a,r);
disp(L);
disp(x);
disp(u);