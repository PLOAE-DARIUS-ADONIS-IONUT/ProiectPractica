function updates = seidelProgressDataDetailed(A, b, x0, eps, itmax)
    % updates va fi un cell-array N×5: {iter,i, x_old, formula, x_new, diff}
    [n,~] = size(A);
    x = x0(:);
    it = 0;
    updates = {};   
    
    while it < itmax
        it = it + 1;
        maxDiff = 0;
        for i = 1:n
            x_old = x(i);
            % calculez suma
            S1 = A(i,1:i-1)*x(1:i-1);
            S2 = A(i,i+1:n)*x(i+1:n);
            % formula ca text
            formula = sprintf('(b(%d) - [%.4g - %.4g]) / %.4g', ...
                              i, S1+S2, 0, A(i,i));
            % dar mai citibil:
            formula = sprintf('(%.4g - (%.4g + %.4g)) / %.4g', ...
                              b(i), S1, S2, A(i,i));
            x_new = (b(i) - (S1 + S2)) / A(i,i);
            diff  = abs(x_new - x_old);
            
            % stochez
            updates(end+1,:) = { it, i, x_old, formula, x_new, diff }; %#ok<AGROW>
            
            x(i) = x_new;
            maxDiff = max(maxDiff, diff);
        end
        if maxDiff <= eps
            break;
        end
    end
end
