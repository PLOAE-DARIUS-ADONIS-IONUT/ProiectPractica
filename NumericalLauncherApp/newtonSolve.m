function x1 = newtonSolve(f, df, x0, eps, itmax)
% NEWTONSOLVE  Aplică metoda Newton: x_{k+1} = x_k - f(x_k)/df(x_k)
%   f     : handle către f(x)
%   df    : handle către derivata f'(x)
%   x0    : aproximare inițială
%   eps   : toleranță pe |x_{k+1}-x_k|
%   itmax : număr maxim de iterații
%
% Returnează x1 = ultima aproximare obținută.

    it  = 0;
    dif = inf;
    while dif > eps && it < itmax
        xnew = x0 - f(x0)/df(x0);
        dif  = abs(xnew - x0);
        x0   = xnew;
        it   = it + 1;
    end
    x1 = x0;
end
