function x = Del(a,lowbound,upperbound)
    
    x = zeros(1,upperbound-lowbound+1);
    x(a-lowbound+1) = 1;

end
