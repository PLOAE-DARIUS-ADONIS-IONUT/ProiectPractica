function data = krylovProgressData(A, y0)
% Colectează toate datele pas-cu-pas pentru metoda Krylov
    n = size(A,1);

    % 1) Construim Y = [y0, y1, ..., y_n]
    Y = zeros(n, n+1);
    F = cell(n+1,1);
    y = y0(:);
    Y(:,1) = y;           F{1} = 'y0 (initial)';
    for k = 1:n
        y = A*y;
        Y(:,k+1) = y;
        F{k+1} = sprintf('y%d = A*y%d',k,k-1);
    end

    % 2) Construim B = [y(n-1),y(n-2),...,y(0)]
    B = Y(:, n:-1:1);     % coloane n,n-1,...,1 → y_{n-1}...y0
    condB = cond(B);

    % 3) rhs = -y(n)
    rhs = -Y(:, n+1);

    % 4) Rezolvăm B*c = rhs → c = [c1;...;cn]
    c = B\rhs;

    % 5) Polinom caracteristic și rădăcini
    coeffs = [1; c(:)];     % λ^n + c1 λ^{n-1}+...+cn
    eigs   = roots(coeffs);

    % 6) Eigenvectori: q_i(A)*y0, cu q_i = p/(λ - eigs(i))
    V = zeros(n,n);
    for i = 1:n
        qi = poly(eigs(i));  % lungime n+1
        v = zeros(n,1);
        for j = 1:length(qi)
            expA = length(qi)-j;
            v = v + qi(j)*(A^expA)*y0;
        end
        V(:,i) = v;
    end

    % 7) Inversa lui A prin Cayley–Hamilton
    invSum = A^n;
    for k = 1:n-1
        invSum = invSum + c(k)*A^(n-k);
    end
    invSum = invSum + c(n)*eye(n);
    invA   = -invSum / c(n);

    % 8) Pachetul de return
    data.Y       = Y;
    data.Formula = F;
    data.CondB   = condB;
    data.C       = c(:).';
    data.EigVals = eigs(:).';
    data.EigVecs = V;
    data.InvA    = invA;
end
