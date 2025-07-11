function [pivots, sizes] = doolittleProgressData(A)
    % Înregistrează pivotii A(k,k) pas cu pas și dimensiunea submatricei
    n = size(A,1);
    pivots = zeros(n,1);

    % sizes = [n, n-1, ..., 1]'
    sizes = (n:-1:1)';

    for k = 1:n
        pivots(k) = A(k,k);
        % Elimina subdiagonala, ca înainte
        for i = k+1:n
            factor = A(i,k)/pivots(k);
            A(i,k+1:n) = A(i,k+1:n) - factor*A(k,k+1:n);
            A(i,k) = 0;
        end
    end
end
