function result = Romberg(y,bound,epsilon)
    new_rows = zeros(1,4);
    Sequence = new_rows;
    Sequence(1,1) = sum(y(bound))/2;
    i = 1;
    step_size = bound(2)-bound(1);%初始化步长
    while true
        for j = 2:min(i,4)%因为龙贝格算法只考虑到龙贝格序列，因此只有四列
            Sequence(i,j) = (4^(j-1)*Sequence(i,j-1)-Sequence(i-1,j-1))/(4^(j-1)-1);
            if i>j && abs(Sequence(i,j)-Sequence(i-1,j)) < epsilon  
                %这里是避免序列中的值非常接近0，所以避免在每个序列地第一项就进行比较
                %满足条件就退出
                result = Sequence(i,j);
                disp(Sequence);%展示龙贝格序列，测试代码可删去
                return
            end
        end
        %增多新的一行，本可以预处理足够大的空间，但觉得没必要
        Sequence = [Sequence;new_rows];
        i = i+1;
        %更新新的梯形序列
        [Sequence(i,1),step_size] = StepSizeVaried(y,bound,step_size,Sequence(i-1,1));
    end

end

