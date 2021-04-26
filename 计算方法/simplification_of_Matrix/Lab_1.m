clc;
clear;
close all;
% % 
% r = input("输入方阵行数 : ");
% a = input("输入矩阵 :\n");

r = 3;
a = [0 3 4 1;1 -1 1 2; 2 1 2 3];
%%
 [L,u,x] = Tri_decomposition(a,r);
% x = Gaussian_eli(a,r);

disp(L);
disp(u);
disp(x)

%% Jacobi
% 
% X = SOR(a,r,0.001,1);
% disp(X);

% result = Gaussian_eli(a,r);
% disp(result);