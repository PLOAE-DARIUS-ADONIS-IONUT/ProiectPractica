% seidelProgressData.m
% Colecteaza evolutia iteratiilor: eroare maxima la fiecare pas
function [iters, errors] = seidelProgressData(A, b, x0, eps, itmax)
    [n, m] = size(A);
    if n ~= m, error('A trebuie sa fie patratica'); end
    x = x0(:);
    it = 0;
    iters = [];
    errors = [];
    while it < itmax
        it = it + 1;
        maxDiff = 0;
        for i = 1:n
            S = A(i,1:i-1)*x(1:i-1) + A(i,i+1:n)*x(i+1:n);
            newXi = (b(i) - S) / A(i,i);
            maxDiff = max(maxDiff, abs(newXi - x(i)));
            x(i) = newXi;
        end
        iters(end+1) = it; %#ok<AGROW>
        errors(end+1) = maxDiff; %#ok<AGROW>
        if maxDiff <= eps
            break;
        end
    end
end

