clc
close all
clear

% main
%%
n = 0:50;
xn = cos(0.82*pi*n)+2*sin(pi*n);
stem(n,xn);

xk = DFT(xn,51);
