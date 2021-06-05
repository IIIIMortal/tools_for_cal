% main function
clear
clc
close all
%% 
x1_base = 0:10;
x1n = (0.9*exp(1j.*pi/3)).^x1_base;
Xk = zeros(1,1000);
% x(k) calculating
for i = 1:1000
    k = i/100;
    for n = 0:10
        Xk(i) = Xk(i)+exp(-1*1j*k*n)*x1n(n+1);
    end
end

i = 1:1000;

figure();
% subplot(121);
% % stem(0:10,x1n);
% 
% % title('原信号');
% xlabel('');
% ylabel('');

subplot(211);
% stem(i/100,abs(Xk));
plot(i/100,abs(Xk(i)),'-r');
title('DTFT幅度')
xlabel('k');
ylabel('abs(Xk)');

subplot(212);
plot(i/100,angle(Xk(i)),'-b');
title('DTFT相位')
xlabel('k');
ylabel('angle(Xk)');
%%
% x2_base = -10:10;
% x2n = 2.^x2_base;
% Xk = DFT(x2n,21);
