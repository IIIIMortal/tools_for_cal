clc;
clear;
close all;

r = input("输入方阵行数 : ");
a = input("输入矩阵 :\n");

result = Gaussian_eli(a,r);

disp(result);