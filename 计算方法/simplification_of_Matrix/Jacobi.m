function X = Jacobi(In,rows,epsilon)
%%
a = zeros(rows);%系数矩阵初始化
b = In(:,rows+1);%常数列

for i = 1:rows%系数矩阵
    a(i,i) = 1/In(i,i);
end
%X[k] = a*(Tran[]*X[k-1] .+ b);

X = zeros(rows,1);

del = -1;
Trans = -1 * In(:,1:rows);

% disp(Trans);
% disp(a);
% disp(b);

for i = 1:rows
    Trans(i,i) = Trans(i,i) + In(i,i);
end

 while del == -1 || del > epsilon
    fX = X;
    X = a * (Trans * X + b);
    del = max(abs(X-fX));
%     disp(X);
end
 

