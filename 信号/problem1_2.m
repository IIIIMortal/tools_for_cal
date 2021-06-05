% main function
clear
clc
close all
%% 
x2_base = -10:10;
x2n = 2.^x2_base;
Xk = zeros(1,1000);
% x(k) calculating
for i = 1:1000
    k = i/50;
    for n = 1:21
        Xk(i) = Xk(i)+x2n(n)*exp(-1*1j*k*(n-11));
    end
end

i = 1:1000;

subplot(211);
plot(i/50,abs(Xk(i)),'-b');
title('DTFT幅度')
xlabel('k');
ylabel('abs(Xk)');

i = 1:200;
subplot(212);
plot(i/50,angle(Xk(i)),'-r');
title('DTFT相位');
xlabel('k');
ylabel('angle(Xk)');
%%
% x2_base = -10:10;
% x2n = 2.^x2_base;
% Xk = DFT(x2n,21);
