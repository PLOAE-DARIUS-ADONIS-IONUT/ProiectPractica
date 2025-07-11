function detA = chioPivotalCondensation(A)
[n, m] = size(A);
if n~=m
    error('Matricea trebuie să fie pătratică');
end
detFactor = 1;

step = 1;  % contor pentru afișare pași

while n > 1
    if A(1,1) == 0
        lin = find(A(:,1)~=0, 1, 'first');
        if isempty(lin)
            detA = 0;
            return;
        end
        A([1 lin],:) = A([lin 1],:);
        detFactor = -detFactor;
    end
    
    B = zeros(n-1);
    for i = 2:n
        for j = 2:n
            B(i-1,j-1) = A(i,j)*A(1,1) - A(i,1)*A(1,j);
        end
    end

    % ✅ Afișare pas în Command Window (sau poate fi afișat într-un `UITable`)
    fprintf('Pasul %d - Submatricea B:\n', step);
    disp(B);
    step = step + 1;

    detFactor = detFactor * (A(1,1)^(n-2));
    A = B;
    n = n - 1;
end

detA = A(1,1) / detFactor;
end
