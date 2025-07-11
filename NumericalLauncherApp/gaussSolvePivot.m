function x = gaussSolvePivot(A, b)
% gaussSolvePivot  Rezolvă A*x = b prin eliminare Gauss cu pivotare parțială
%   A: matrice pătratică n×n
%   b: vector coloană n×1
%   x: soluția n×1

    [n, m] = size(A);
    if n ~= m
        error('Matricea A trebuie să fie pătratică');
    end
    if numel(b) ~= n
        error('Vectorul b trebuie să aibă %d elemente', n);
    end
    Aug = [A, b];

    % Forward elimination cu pivotare parțială
    for k = 1:n-1
        % găsește rândul cu pivotul maxim în modul pe coloana k
        [~, lin] = max(abs(Aug(k:n, k)));
        lin = lin + k - 1;
        if Aug(lin,k) == 0
            error('Sistemul nu are soluție unică (pivot zero la pasul %d)', k);
        end
        % dacă pivotul nu este pe diagonală, swap liniile
        if lin ~= k
            Aug([k lin], :) = Aug([lin k], :);
        end
        % eliminare
        for i = k+1:n
            factor = Aug(i,k) / Aug(k,k);
            Aug(i, k+1:end) = Aug(i, k+1:end) - factor * Aug(k, k+1:end);
            Aug(i, k) = 0;  % explicităm zero
        end
    end

    % check ultim pivot
    if Aug(n,n) == 0
        error('Sistemul nu are soluție unică (pivot zero pe ultima linie)');
    end

    % Back substitution
    x = zeros(n,1);
    x(n) = Aug(n,end) / Aug(n,n);
    for i = n-1:-1:1
        S = Aug(i,i+1:n) * x(i+1:n);
        x(i) = (Aug(i,end) - S) / Aug(i,i);
    end
end
