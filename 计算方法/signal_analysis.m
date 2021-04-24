%求正弦信号的傅里叶变换
Ns = 512;%采样点
n = 0 : Ns-1;
xn = 4.6*sin(2*pi*n/Ns);%离散的正弦信号
Xn =  fft( xn ) ;    %fft的结果是复数
Xn = abs(Xn) *2 /Ns; %求绝对值得到幅值，乘以2，乘以Ns是由傅里叶变换公式导致的
%用二维图显示原始正弦信号
subplot(3,1,1),plot(n, xn); %画出原始正弦信号
xlabel('n = 0:511'); ylabel('振幅');
title('原始的正弦信号');
%用二维图显示信号0~255次的谐波
Nyquist = Ns/2-1;%根据奈奎斯特定理，只需显示前255次的谐波
subplot(3,1,2),plot(n(1:Nyquist), Xn(1:Nyquist)); 
xlabel('n = 0:255'); ylabel('谐波幅值');
title('0~255次的谐波');
%用二维图显示信号频率与幅值的关系
f0 = 50;    %假设信号的固有频率为50Hz
f = n*f0;    %频率与横轴序列n的映射关系
subplot(3,1,3),plot(f(1:Nyquist), Xn(1:Nyquist)); %根据奈奎斯特定理，只需显示前fs/2部分的频谱
xlabel('f = 0, 50Hz... 255*f0 Hz '); ylabel('幅值');
title('频率与幅值的关系');
