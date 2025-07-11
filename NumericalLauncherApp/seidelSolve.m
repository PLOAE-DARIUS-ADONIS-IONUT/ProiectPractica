% seidelSolve.m
% Rezolvă sistemul A*x = b folosind metoda Gauss-Seidel
function x = seidelSolve(A, b, x0, eps, itmax)
    [n, m] = size(A);
    if n ~= m
        error('A trebuie sa fie patratica');
    end
    if numel(b) ~= n
        error('b trebuie sa fie %d×1', n);
    end
    x = x0(:);
    it = 0;
    maxDiff = Inf;
    while maxDiff > eps && it < itmax
        maxDiff = 0;
        for i = 1:n
            if A(i,i) == 0
                error('Eroare: pivot zero la A(%d,%d)', i, i);
            end
            S = A(i,1:i-1)*x(1:i-1) + A(i,i+1:n)*x( i+1:n );
            newXi = (b(i) - S) / A(i,i);
            maxDiff = max(maxDiff, abs(newXi - x(i)));
            x(i) = newXi;
        end
        it = it + 1;
    end
    if it >= itmax && maxDiff > eps
        error('Nu s-a putut aproxima solutia in %d iteratii cu eroarea %g', itmax, eps);
    end
end
