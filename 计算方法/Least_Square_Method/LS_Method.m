function A = LS_Method(level,testset)
    sizeofSet = size(testset);
%     提取出测试点集的y
    y = testset(:,2);
%     初始化中间矩阵c
    c = ones(sizeofSet(1),level+1);
%     利用测试点集给中间矩阵赋值，由于是多项式拟合所以可以这么暴力，如果是自定义函数集合，可以利用传入的函数句柄矩阵和点集的x进行计算赋值
    for cols = 2:level+1
        c(:,cols) = testset(:,1).^(cols-1);
    end
%     C = c'*c;
     disp(C);
    Y = c'*y;
%     disp(Y);
% 将处理好的C和Y矩阵合在一起形成可以传给自己写的三角分解法的参数形式
    all = [C,Y];
%     disp(all);
% 返回值即为所求
    [~,~,A] = Tri_decomposition(all,level+1);

end

