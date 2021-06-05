% main function
clear
clc
close all
%% 
x1_base = 0:10;
x1n = 0.9*(exp(1j.*pi/3)).^x1_base;
Xk = zeros(1,1000);
for i = 1:1000
    k = i/100;
    for n = 1:11
        Xk(i) = Xk(i)+exp(-1j*k*n)*x1n(n);
    end
end

i = 1:1000;
figure(2);
subplot(311);
stem(0:10,x1n);
title('原信号');
xlabel('');
ylabel('');

subplot(312);
stem(i/100,abs(Xk));
title('DTFT幅度')

subplot(313);
stem(i/100,angle(Xk));
title('DTFT相位')
%%
% x2_base = -10:10;
% x2n = 2.^x2_base;
% Xk = DFT(x2n,21);
