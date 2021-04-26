function [L,u,x] = Tri_decomposition(A,rows)

%这里是为了计算u_ij
    u=A;
    s = zeros(rows);%这里定义一个s用于放置列主元判断时的量
    p = diag(ones(1,rows));
    for k=1:rows
       %%这个部分是（列主元）用的，如果不需要列主元，只是单纯的三角分解，就可以跳过这一部分（8~24行）
        s(k:rows,k) = u(k:rows,k);%赋值，在s中判断
        for i = k:rows
            s(i,k)=A(i,k)-u(i,1:k-1) * u(1:k-1,k);
        end
        
        max_u = max(s(k:rows,k));%找到最大值
%         max_u
        max_u_r = find(abs(s(:,k)-max_u)<0.001,1); % 找到最大值index
        if max_u_r ~= k%如果和当前不同就交换
            u([max_u_r k],:)=u([k max_u_r],:);
            A([max_u_r k],:)=A([k max_u_r],:);
            p([max_u_r k],:)=p([k max_u_r],:);
        end

%         clear s_i;
%         k
%         disp(u);
        %%
        for j=k:rows + 1%更新列
            u(k,j)=A(k,j)-u(k,1:k-1) * u(1:k-1,j);%这里用了矩阵的乘法，乘出来是一个常数
        end
        for i=k+1:rows %更新行
            u(i,k)=(A(i,k)-u(i,1:k-1) * u(1:k-1,k))/u(k,k);
        end
        
    end
    %后面的是把x，L，U求出来
    y = u(:,rows+1);
    u = u(:,1:rows);
    x = zeros(rows,1);
    x(rows) = y(rows)/u(rows,rows);
    for i = rows-1:-1:1 %这里是把x求出来
        f_d = u(i,i+1:rows) * x((i+1):rows);
        x(i)=(y(i)-f_d)/u(i,i);
    end
    L = zeros(rows);
    for i = 1:rows
        L(i+1:rows,i)=u(i+1:rows,i);
    end
    u = u-L;
    L = L+diag(ones(1,rows));
    disp(p);
end

