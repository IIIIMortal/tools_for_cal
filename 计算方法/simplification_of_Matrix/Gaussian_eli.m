function x = Gaussian_eli(A,rows)
%这里是默认系数矩阵为方阵
    i = 2;
    x = zeros(1,rows);
    m = zeros(1,rows);
    while(i<=rows)
        %%从这里开始是开始迭代
	%这个地方是用于寻找列主元
        max_col_i = max(A(:,i-1));
        max_l = find(abs(A(:,i-1) -max_col_i)<0.01); 
        if max_l ~= i-1
	    %交换两列
            A([max_l i-1],:) = A([i-1 max_l],:);
        end
	%%如果变换之后仍然是首项为0，则该循环直接跳过，并且方程可能直接无解
        if abs(A(i-1, i-1) - 0)<0.01
            continue;
        end
	%%

	%找到主元之后，对每一行求系数以将最左列消去
        for j = i:rows
            m(j) = A(j,i-1)/A(i-1,i-1);
            A(j,:) = A(j,:) - m(j)*A(i-1,:);
        end
        
        i = i+1;
    end
    %%这里就是将x求解出来
    x(rows)=A(rows,rows+1)/A(rows,rows);
    for k = rows-1:-1:1
        former_add = sum(x.*A(k,1:rows));
        x(k)=(A(k,rows+1)-former_add)/A(k,k);
    end
end

