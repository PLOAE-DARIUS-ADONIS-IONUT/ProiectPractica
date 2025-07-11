function [L,U,P,x,detA] = doolittleSolve(A, b)
% doolittleSolve  L U = P*A cu pivotare, rezolvă A*x=b și calculează det
%   A: matrice pătratică n×n
%   b: vector coloană n×1
% Returns:
%   L: matricea L cu diagonala 1
%   U: matricea U
%   P: matricea de permutare
%   x: soluția A*x=b
%   detA: determinantul calculat incl. semn pivotări

[n,m] = size(A);
if n~=m, error('A trebuie să fie pătratică'); end
if numel(b)~=n, error('b trebuie coloană lungime n'); end

% Inițializări
L = eye(n);
U = zeros(n);
P = eye(n);
swapCount = 0;

for k = 1:n
    % 1) Pivotare parțială: găsește max pe coloana k
    [~, idx] = max(abs(A(k:n,k)));
    idx = idx + k - 1;
    if idx ~= k
        A([k idx],:) = A([idx k],:);
        P([k idx],:) = P([idx k],:);
        L([k idx],1:k-1) = L([idx k],1:k-1);
        swapCount = swapCount + 1;
    end

    % 2) Construiește U(k,k:n) și L(k+1:n,k)
    U(k,k:n) = A(k,k:n);
    L(k+1:n,k) = A(k+1:n,k) / U(k,k);

    % 3) Actualizează submatricea
    for i = k+1:n
        A(i,k+1:n) = A(i,k+1:n) - L(i,k)*U(k,k+1:n);
    end
end

% 4) Rezolvă P*A*x = L*U*x = P*b
b2 = P*b;
y  = forwardSub(L, b2);
x  = backSub(U, y);

% 5) Determinant
detA = prod(diag(U));
if mod(swapCount,2)==1
    detA = -detA;
end

end

% --- sub‑funcții pentru forward/back substitution:

function y = forwardSub(L, b)
n = length(b); y = zeros(n,1);
for i = 1:n
    y(i) = (b(i) - L(i,1:i-1)*y(1:i-1));
end
end

function x = backSub(U, y)
n = length(y); x = zeros(n,1);
for i = n:-1:1
    x(i) = (y(i) - U(i,i+1:n)*x(i+1:n)) / U(i,i);
end
end
