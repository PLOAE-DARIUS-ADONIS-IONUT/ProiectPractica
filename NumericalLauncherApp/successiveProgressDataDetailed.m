function updates = successiveProgressDataDetailed(g, x0, eps, itmax)
    % updates: cell array cu câte un rând pentru fiecare iterație:
    % {k, x_old, x_new, diff, formula}
    x = x0;
    updates = {};
    for k = 1:itmax
        x_new = g(x);
        d     = abs(x_new - x);
        % formulează textul
        formula = sprintf('x_{%d+1} = g(%.6g) = %.6g', k, x, x_new);
        updates(end+1,:) = {k, x, x_new, d, formula}; %#ok<AGROW>
        if d <= eps
            return;
        end
        x = x_new;
    end
end
