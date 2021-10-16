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
figure(3)

n3 = -10:10;
subplot(311);
x31 = 2*Del(0,-10,10)+1*Del(2,-10,10)-1*Del(3,-10,10)+3*Del(4,-10,10);
stem(n3,x31,'.');
title('x(n)');
xlabel('n');
ylabel('x(n)');
grid minor;

subplot(312);
x32 = x31;
stem(n3-3,x32,'.');
title('x(n-3)');
xlabel('n');
ylabel('x(n-3)');
grid minor;

subplot(313);
x33 = 2*Del(0,-10,10)+1*Del(-2,-10,10)-1*Del(-3,-10,10)+3*Del(-4,-10,10);
stem(n3,x33,'.');
title('x(-n)');
xlabel('n');
ylabel('x(-n)');
grid minor;
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
grid minor;

%%
% question 5: 单位脉冲响应 y[n]+4y[n-1]+2y[n-2]+y[n-3] = x[n]

y5 = [1,4,2,1];
x5 = 1;
n5 = -20:20;

h = impz(y5,x5,n5);
figure(5);
stem(n5,h,'.');
title('单位脉冲响应');
xlabel('k');
ylabel('h(k)');
grid minor;

%%
% ztrans

syms n;
X = ztrans(cos(n)*heaviside(n))
syms z;
x = iztrans(1/((1+z)*(2+z)))


%% 
% question 7
num7 = [0,2,1];
den7 = [1,2,1];
figure(7);
zplane(num7,den7);

[h,t] = impz(num7,den7);
figure(8);
subplot(211);
stem(t,h,'.');
title('单位脉冲响应h(n)');
xlabel('n');
ylabel('h(n)');
grid minor;

subplot(212);
[H,w] = freqz(num7,den7);
semilogy(w/pi,abs(H),'.');
title('频率响应H(w)');
xlabel(' Frequency \omega/\pi');
ylabel('H(w)');
grid minor;

