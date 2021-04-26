function A = LS_Method_randombase(y_handle,rank,testset)
%rank是函数族的数量
    sizeofSet = size(testset);
%     提取出测试点集的y
    y = testset(:,2);
%     disp(y);
%     disp(y_handle);
%     初始化中间矩阵c
    c = ones(sizeofSet(1),rank);
%     利用测试点集给中间矩阵赋值，由于是多项式拟合所以可以这么暴力，如果是自定义函数集合，可以利用传入的函数句柄矩阵和点集的x进行计算赋值
    for rows = 1:sizeofSet(1)
        c(rows,:) = y_handle(testset(rows,1));
    end
    disp(c);
    C = c'*c;
%      disp(C);
    Y = c'*y;
%     disp(Y);
% 将处理好的C和Y矩阵合在一起形成可以传给自己写的三角分解法的参数形式
    all = [C,Y];
%     disp(all);
% 返回值即为所求
    [~,~,A] = Tri_decomposition(all,rank);

end