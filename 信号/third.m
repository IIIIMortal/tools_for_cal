clc
close all
clear

% main
%%

testbound = [1,6];
leng = testbound(2)-testbound(1);
result_t = zeros(1,leng+1);
result_tf = zeros(1,leng+1);
i = 1;
for m = testbound(1):testbound(2)
    
    N = 4^m;
    n = 0:N-1;
    xn = sin(0.2*pi*n)+randn(1,N);
%     DFT
    tic
    xk = DFT_clean(xn,N);
    toc
    result_t(i) = toc;
    
%     FFT
    tic
    xkf = fft(xn,N);
    toc
    result_tf(i) = toc;
    disp(m);
    i = 1+i;
end
%%
disp(result_t);
disp(result_tf);
i = 1:leng+1;

subplot(211);
plot(testbound(1):testbound(2),result_t(i),'-r');
title('DFT速度')
xlabel('m');
ylabel('time');


subplot(212);
plot(testbound(1):testbound(2),result_tf(i),'-r');
title('FFT速度')
xlabel('m');
ylabel('time');

