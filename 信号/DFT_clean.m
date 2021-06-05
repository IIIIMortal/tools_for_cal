function Xk = DFT_clean(xn,N)
    Xk = zeros(1,N);    
    for k=1:N
        sn =0.0;
        for i=1:N
            sn = sn+xn(i)*exp(-1j*2*pi*i*k/N);
        end
        Xk(k) = sn;
    end
end