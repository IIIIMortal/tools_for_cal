function Xk = DFT(xn,N)
    Xk = zeros(1,N);    
    for k=1:N
        sn =0.0;
        for i=1:N
            sn = sn+xn(i)*exp(-1j*2*pi*i*k/N);
        end
        Xk(k) = sn;
    end
    figure(2);
    subplot(311);
    stem(0:N-1,Xk,'.');
    title('原信号');

    subplot(312);
    stem(0:N-1,abs(Xk),'.');
    title('DFT幅度')
    
    subplot(313);
    stem(0:N-1,angle(Xk),'.');
    title('DFT相位')
end