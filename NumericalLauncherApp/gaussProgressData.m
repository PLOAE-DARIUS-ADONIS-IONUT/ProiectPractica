function [pivots, sizes] = gaussProgressData(A, b)
    [n, m] = size(A);
    if n~=m, error('A trebuie pătratică'); end
    pivots = []; sizes = [];
    for k = 1:n-1
        piv = A(k,k);
        if piv == 0
            lin = find(A(k+1:end,k)~=0,1) + k;
            if isempty(lin)
                pivots(end+1) = 0;
                sizes(end+1)  = n - k + 1;
                return;
            end
            A([k lin],:) = A([lin k],:);
            b([k lin])   = b([lin k]);
            piv = A(k,k);
        end
        pivots(end+1) = piv;
        sizes(end+1)  = n - k + 1;
        for i = k+1:n
            factor = A(i,k)/piv;
            A(i,k) = 0;
            A(i,k+1:end) = A(i,k+1:end) - factor*A(k,k+1:end);
            b(i) = b(i) - factor*b(k);
        end
    end
    pivots(end+1) = A(n,n);
    sizes(end+1)  = 1;
end
