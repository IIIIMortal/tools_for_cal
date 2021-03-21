function [x,u] = Tri_decomposition(A,rows)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
%这里是为了计算u_ij
    u=A;
    s = zeros(rows);%这里定义一个s用于放置列主元判断时的量
    
    for k=1:rows
       %%
        s(k:rows,k) = u(k:rows,k);%赋值，在s中判断
        for i = k:rows
            s(i,k)=A(i,k)-u(i,1:k-1) * u(1:k-1,k);
        end
        
        max_u = max(s(k:rows,k));%找到最大值
        
        max_u_r = find(abs(s(:,k)-max_u)<0.01,1); 
        if max_u ~= k
            u([max_u_r k],:)=u([k max_u_r],:);
            A([max_u_r k],:)=A([k max_u_r],:);
        end
%         clear s_i;
%         k
%         disp(u);
        %%
        for j=k:rows + 1
            u(k,j)=A(k,j)-u(k,1:k-1) * u(1:k-1,j);
        end
        for i=k+1:rows
            u(i,k)=(A(i,k)-u(i,1:k-1) * u(1:k-1,k))/u(k,k);
        end
        
    end
    
    y = u(:,rows+1);
    x = zeros(rows,1);
    x(rows) = y(rows)/u(rows,rows);
    for i = rows-1:-1:1
        f_d = u(i,i+1:rows) * x((i+1):rows);
        x(i)=(y(i)-f_d)/u(i,i);
    end
    
end

