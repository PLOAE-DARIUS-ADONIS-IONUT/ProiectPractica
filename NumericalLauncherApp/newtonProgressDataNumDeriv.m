function [x_vals, diffs, steps] = newtonProgressDataNumDeriv(f, x0, eps, itmax)
    h = 1e-6;
    x_vals = x0;
    diffs  = [];
    steps  = "";

    for k = 1:itmax
        fx   = f(x0);
        dfx  = (f(x0+h) - f(x0-h)) / (2*h);
        if dfx == 0
            steps = steps + sprintf("Iter %d: derivative ≈ 0 → stop\n\n", k);
            break;
        end
        x1   = x0 - fx/dfx;
        dif  = abs(x1 - x0);

        steps = steps + sprintf("Iterația %d:\n", k);
        steps = steps + sprintf("  x_%d = %.6f\n", k-1, x0);
        steps = steps + sprintf("  f(x_%d) = %.6f\n", k-1, fx);
        steps = steps + sprintf("  f'(x_%d) ≈ (f(%.6f+h)-f(%.6f-h))/(2h) = %.6f\n", k-1, x0, x0, dfx);
        steps = steps + sprintf("  x_%d = x_%d - f/f' = %.6f\n", k, k-1, x1);
        steps = steps + sprintf("  |x_%d - x_%d| = %.6f\n\n", k, k-1, dif);

        x_vals(end+1) = x1;  %#ok<AGROW>
        diffs(end+1)  = dif; %#ok<AGROW>

        if dif <= eps
            steps = steps + sprintf("Stop: error %.6f ≤ ε = %.6f\n", dif, eps);
            break;
        end
        x0 = x1;
    end
end
