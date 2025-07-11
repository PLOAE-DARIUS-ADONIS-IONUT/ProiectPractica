function [I, n] = trapezoidSolve(f, a, b, eps)
% trapezoidSolve  Aproximarea ∫_a^b f(x)dx prin regula trapezelor până la eroarea eps
%   f   – funcţie handle (ex. @(x) 1./(x+1))
%   a,b – capete interval
%   eps – toleranţă
% Ieşiri:
%   I – valoarea aproximată a integralei
%   n – numărul final de trapeze

    % Validări simple
    if b <= a
        error('Trebuie b>a');
    end
    if eps <= 0
        error('eps trebuie >0');
    end

    % Iniţializare
    n     = 1;
    I     = (f(a) + f(b))*(b-a)/2;
    Iold  = Inf;

    % Iterează
    while abs(I - Iold) > eps
        Iold = I;
        n    = n*2;
        h    = (b - a)/n;
        S    = 0;
        for i = 1:n-1
            S = S + f(a + i*h);
        end
        I = (f(a) + 2*S + f(b)) * h/2;
    end
end
