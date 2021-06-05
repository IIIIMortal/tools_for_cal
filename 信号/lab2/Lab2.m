clc;
clear;
close all;


%%
% generate the signal

x1 = zeros(1,31);
for i = 1:9
    x1(11+i) = 3*(i-5);
end
figure(1)
stem(-15:15,x1);
grid minor;
title('x(n)');
xlabel('n');
ylabel('x(n)');
%%
% generate complex-value signal

n21 = 0:32;
x21 = exp(1j*(pi/8).*n21);

n22 = 0:32;
x22 = exp((-0.1+0.3*1j).*n22);

figure(21)
subplot(411);
stem(0:32,real(x21),'.');
title('实部');
xlabel('n');
ylabel('Real(x(n))');
subplot(412);
stem(0:32,imag(x21),'.');
title('虚部');
xlabel('n');
ylabel('Imag(x(n))');
subplot(413);
stem(0:32,abs(x21),'.');
title('幅值');
xlabel('n');
ylabel('Abs(x(n))');
subplot(414);
stem(0:32,angle(x21),'.');
title('相角');
xlabel('n');
ylabel('Angle(x(n))');

figure(22)
subplot(411);
stem(0:32,real(x22),'.');
title('实部');
xlabel('n');
ylabel('Real(x(n))');
subplot(412);
stem(0:32,imag(x22),'.');
title('虚部');
xlabel('n');
ylabel('Imag(x(n))');
subplot(413);
stem(0:32,abs(x22),'.');
title('幅值');
xlabel('n');
ylabel('Abs(x(n))');
subplot(414);
stem(0:32,angle(x22),'.');
title('相角');
xlabel('n');
ylabel('Angle(x(n))');

%%
% draw drifting
x

%%
% conv calculating

x41 = 1:4;
x42 = ones(1,5);
x4r = conv(x41,x42);
figure(4);
stem(x4r,'.');
disp(x4r);
title('卷积结果');
xlabel('n');
ylabel('result');