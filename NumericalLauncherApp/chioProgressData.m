function [pivots, sizes] = chioProgressData(A)
% chioProgressData  Date pentru graficarea evoluției metodei Chio
%   A: matrice pătratică n×n
%   pivots: vector cu valorile pivotului A(1,1) la fiecare pas
%   sizes:  vector cu dimensiunea submatricii (n, n-1, …, 1)

    [n, m] = size(A);
    if n ~= m
        error('Matricea trebuie să fie pătratică');
    end

    pivots = [];
    sizes  = [];

    while n > 1
        % pivotare dacă A(1,1)==0
        if A(1,1) == 0
            idx = find(A(2:end,1) ~= 0, 1) + 1;
            if isempty(idx)
                pivots(end+1) = 0;
                sizes(end+1)  = n;
                return;
            end
            A([1, idx], :) = A([idx, 1], :);
        end

        % stochează datele curente
        pivots(end+1) = A(1,1);
        sizes(end+1)  = n;

        % construiește submatricea Chio
        B = zeros(n-1);
        for i = 2:n
            for j = 2:n
                B(i-1,j-1) = A(i,j)*A(1,1) - A(i,1)*A(1,j);
            end
        end

        A = B;
        n = n - 1;
    end

    % ultimul pas (rămâne 1×1)
    pivots(end+1) = A(1,1);
    sizes(end+1)  = 1;
end
