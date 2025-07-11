function data = trapezoidProgressData(f, a, b, eps)
% Returnează o structură cu toți pașii și detaliile calculelor
%   data este struct cu câmpuri:
%   steps, n, h, x_vals, f_vals, fx0, fxn, sumf, I, dI

    n    = 1;
    h    = (b-a)/n;
    fx0  = f(a);
    fxn  = f(b);
    sumf = 0;
    I    = (fx0 + fxn)*h/2;
    Iold = Inf;
    step = 1;

    % inițializăm structura
    data.steps = step;
    data.n     = n;
    data.h     = h;
    data.fx0   = fx0;
    data.fxn   = fxn;
    data.sumf  = sumf;
    data.I     = I;
    data.dI    = NaN;
    data.x_vals{1} = a:h:b;                    % noduri x0..xn
    data.f_vals{1} = f(data.x_vals{1});        % f(xi)

    while abs(I - Iold) > eps
        Iold = I;
        n    = n * 2;
        h    = (b-a)/n;
        x    = a:h:b;
        y    = f(x);
        fx0  = y(1);
        fxn  = y(end);
        sumf = sum(y(2:end-1));
        I    = (fx0 + 2*sumf + fxn)*h/2;
        step = step + 1;

        % stocare
        data.steps(end+1,1) = step;
        data.n(end+1,1)     = n;
        data.h(end+1,1)     = h;
        data.fx0(end+1,1)   = fx0;
        data.fxn(end+1,1)   = fxn;
        data.sumf(end+1,1)  = sumf;
        data.I(end+1,1)     = I;
        data.dI(end+1,1)    = abs(I - Iold);
        data.x_vals{end+1}  = x;
        data.f_vals{end+1}  = y;
    end
end
