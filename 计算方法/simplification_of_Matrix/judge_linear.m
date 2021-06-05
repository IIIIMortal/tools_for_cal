function flag = judge_linear(A,rows)
%这里是默认系数矩阵为方阵
    size1 = size(A);
    i = 2;
    m = zeros(1,rows);
    while(i<=rows)
        %%从这里开始是开始迭代
	%这个地方是用于寻找列主元
%         disp(A);
        max_col_i = max(A(i-1:rows,i-1));
        max_l = find(abs(A(i-1:rows,i-1) -max_col_i)<0.01,1); 
        if max_l ~= i-1
	    %交换两列
%             disp([max_l i-1]);
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
%     disp(A);
    if abs(A(rows,size1(2)))>0.01 && abs(A(rows,size1(2)-1)-0)<0.01
        flag = 1;
    else
        flag = 0;
    end
end

