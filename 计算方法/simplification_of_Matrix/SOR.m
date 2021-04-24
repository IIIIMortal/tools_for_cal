function X = SOR(In,rows,epsilon,Ome)
    a = zeros(rows);
    b = In(:,rows+1);
    omega = ones(rows,1) * Ome;
    step = 0;
    for i = 1:rows
    a(i,i) = 1/In(i,i);
    end

    X = zeros(rows,1);
    del = ones(rows,1);

    Trans = -1 * In(:,1:rows);
    while max(abs(del))>epsilon
        step = step+1;
        fx = X;
        for i = 1:rows
            X(i) = X(i) + omega(i) * a(i,i) * (Trans(i,:) * X + b(i));
        end
        del = X-fx;
    end
    disp(step);
end

