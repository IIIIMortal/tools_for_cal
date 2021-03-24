function X = Gau_Seidel(In,rows,epsilon)
    %%
    a = zeros(rows);
    b = In(:,rows+1);
    
    for i = 1:rows
    a(i,i) = 1/In(i,i);
    end

    X = zeros(rows,1);
    del = -1;

    Trans = -1 * In(:,1:rows);
    for i = 1:rows
        Trans(i,i) = 0;
    end
%     disp(Trans);
%     disp(a);
%     disp(b);
    while del == -1 || del>epsilon
        fx = X;
        for j = 1:rows
            X(j) = a(j,j) * (Trans(j,:) * X + b(j));
        end
        del = max(abs(X-fx));
%         disp(X);
    end
end



