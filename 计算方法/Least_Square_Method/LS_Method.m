function A = LS_Method(level,testset)
    sizeofSet = size(testset);
    y = testset(:,2);
    c = ones(sizeofSet(1),level+1);
    for cols = 2:level+1
        c(:,cols) = testset(:,1).^(cols-1);
    end
    C = c'*c;
%     disp(C);
    Y = c'*y;
%     disp(Y);
    all = [C,Y];
%     disp(all);
    [~,~,A] = Tri_decomposition(all,level+1);

end

