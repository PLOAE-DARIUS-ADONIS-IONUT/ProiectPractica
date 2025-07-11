% successiveProgressData.m
% Colectează evoluția eroării |x_{k+1} - x_k| la fiecare iterație
function [iters, diffs] = successiveProgressData(g, x0, eps, itmax)
    x = x0;
    iters = zeros(itmax,1);
    diffs = zeros(itmax,1);
    for k = 1:itmax
        x_new = g(x);
        d = abs(x_new - x);
        iters(k) = k;
        diffs(k) = d;
        x = x_new;
        if d <= eps
            iters = iters(1:k);
            diffs = diffs(1:k);
            return;
        end
    end
end