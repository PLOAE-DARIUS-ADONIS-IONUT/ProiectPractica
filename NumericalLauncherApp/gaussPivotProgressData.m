function [pivots, sizes] = gaussPivotProgressData(A, b)
% gaussPivotProgressData – pași pentru Gauss cu pivotare parțială
%   A: matrice pătratică n×n
%   b: vector coloană n×1
%   pivots: vector de pivoti a_{k,k} după eventual swap
%   sizes: vector de dimensiuni (n, n–1, …, 1)

    [n, m] = size(A);
    if n~=m, error('A trebuie pătratică'); end
    pivots = []; sizes = [];

    for k = 1:n-1
        % 1) dacă pivotul e zero, găsește rând și swap
        if A(k,k) == 0
            lin = find(A(k+1:end,k)~=0,1) + k;
            if isempty(lin)
                pivots(end+1)=0;
                sizes(end+1)=n-k+1;
                return;
            end
            A([k lin],:) = A([lin k],:);
            b([k lin])   = b([lin k]);
        end
        piv = A(k,k);
        pivots(end+1) = piv;          % salvează pivotul actual
        sizes(end+1) = n - k + 1;     % dimensiunea sub‑sistemului

        % 2) eliminare
        for i = k+1:n
            factor = A(i,k)/piv;
            A(i,k) = 0;
            A(i,k+1:end) = A(i,k+1:end) - factor*A(k,k+1:end);
            b(i) = b(i) - factor*b(k);
        end
    end

    % ultimul pivot
    pivots(end+1) = A(n,n);
    sizes(end+1)  = 1;
end
