function [result,new_stepsize] = StepSizeVaried(y,bound,last_stepsize,last_value)
% 这个函数就是用来更新T_n 到T_2n，返回新步长
    new_stepsize = last_stepsize/2;
    new_x = bound(1)+new_stepsize : last_stepsize : bound(2);%创建新的多出来的序列
    new_y = y(new_x);%使用句柄计算新序列的函数值
    result = last_value/2 + new_stepsize*sum(new_y);%更新
    
end

