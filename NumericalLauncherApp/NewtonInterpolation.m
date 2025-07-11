function N = NewtonInterpolation(x, f, z)
    % Computes valoarea polinomului lui Newton în z
    n = numel(x) - 1;
    % Tabel diferențe divizate
    D = zeros(n+1);
    D(:,1) = f(:);
    for col = 2:n+1
        for row = 1:(n+2-col)
            D(row,col) = (D(row+1,col-1)-D(row,col-1)) / (x(row+col-1)-x(row));
        end
    end
    % Evaluare
    N = D(1,1);
    term = 1;
    for k = 1:n
        term = term*(z - x(k));
        N = N + D(1,k+1)*term;
    end
end
