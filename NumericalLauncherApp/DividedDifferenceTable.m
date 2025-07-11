function DD = DividedDifferenceTable(x, f)
% Construiește o matrice (n+1)x(n+2):
% col(1) = xi, col(2) = f[xi], col(3) = f[x0;x1], ..., col(n+2) = f[x0;...;xn]
    n = numel(x)-1;
    DD = NaN(n+1, n+2);
    DD(:,1) = x(:);
    DD(:,2) = f(:);
    for j = 3:n+2         % coloana diferențelor de ordin j-2
        for i = 1:(n+2-j)
            DD(i,j) = (DD(i+1,j-1) - DD(i,j-1)) / (x(i+j-2) - x(i));
        end
    end
end
