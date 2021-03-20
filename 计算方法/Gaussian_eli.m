function x = Gaussian_eli(A,rows)

    i = 2;
    x = zeros(1,rows);
    m = zeros(1,rows);
    while(i<=rows)
        %%从这里开始是
        max_col_i = max(A(:,i-1));
        max_l = find(abs(A(:,i-1) -max_col_i)<0.01); 
        if max_l ~= i-1
            A([max_l i-1],:) = A([i-1 max_l],:);
        end
        %%
        for j = i:rows
            m(j) = A(j,i-1)/A(i-1,i-1);
            A(j,:) = A(j,:) - m(j)*A(i-1,:);
        end
        
        i = i+1;
    end
    %%
    x(rows)=A(rows,rows+1)/A(rows,rows);
    for k = rows-1:-1:1
        former_add = sum(x.*A(k,1:rows));
        x(k)=(A(k,rows+1)-former_add)/A(k,k);
    end
end

