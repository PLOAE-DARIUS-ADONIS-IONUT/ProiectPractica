function c = krylovSolve(A, y0)
% k​rylovSolve Aplcă metoda Krylov pentru determinarea coeficienților pA(λ)
% A ∈ R^{n×n}, y0 ∈ R^n (vector nenul)
    n = size(A,1);
    % 1) Construim y^(0..n)
    Y = zeros(n,n+1);
    Y(:,1) = y0(:);
    for k = 2:n+1
        Y(:,k) = A * Y(:,k-1);
    end
    % 2) Matricea B = [ y(n) … y(1) y(0) ]
    B = Y(:, n+1:-1:1);
    % 3) Dreapta = –y(n+1)
    rhs = -Y(:,end);
    % 4) Rezolvă B(:,1:n) * c = rhs
    c = B(:,1:n) \ rhs;
    c = c(:);  % vector [c1;…;cn]
end
