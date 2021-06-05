clear;
close all;
clc;
Ts = 1/32000;
N = 16;
n = 0:N-1;
xn = cos(2*pi*6.5*1000*Ts*n)+cos(2*pi*7*1000*Ts*n)+cos(2*pi*9*1000*Ts*n);

Xk = DFT(xn,N);