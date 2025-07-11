function x = gaussSolve(A, b)
% gaussSolve Rezolvă A*x = b prin eliminare Gauss cu pivotare
    [n, m] = size(A);
    if n ~= m
        error('A trebuie să fie pătratică');
    end
    if numel(b) ~= n
        error('b trebuie să aibă dimensiunea %d×1', n);
    end
    Aug = [A, b];
    for k = 1:n-1
        [~, p] = max(abs(Aug(k:n, k)));
        p = p + k - 1;
        if Aug(p,k)==0
            error('Sistem fără soluție unică');
        end
        if p~=k
            Aug([k p],:) = Aug([p k],:);
        end
        for i = k+1:n
            f = Aug(i,k)/Aug(k,k);
            Aug(i,k:end) = Aug(i,k:end) - f*Aug(k,k:end);
        end
    end
    if Aug(n,n)==0
        error('Sistem fără soluție unică');
    end
    x = zeros(n,1);
    x(n) = Aug(n,end)/Aug(n,n);
    for i = n-1:-1:1
        S = Aug(i,i+1:n)*x(i+1:n);
        x(i) = (Aug(i,end) - S)/Aug(i,i);
    end
end
