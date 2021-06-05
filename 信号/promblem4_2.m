clear;
close all;
clc;
xn = zeros(1,256);
Ts = 1/32000;
N = 256;
n = 1:16;
xn(1:16) = cos(2*pi*6.5*1000*Ts*n)+cos(2*pi*7*1000*Ts*n)+cos(2*pi*9*1000*Ts*n);

Xk = DFT(xn,N);