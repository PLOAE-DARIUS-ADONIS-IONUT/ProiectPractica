function newton_simple()
    % Soluționarea ecuației f(x) = 0 cu metoda Newton (tangentei)
    
    % Definirea funcției și a derivatei sale
    f = @(x) x^3 + 4 * x^2 - 10;
    fderiv = @(x) 3 * x^2 + 8 * x;

    % Citirea datelor de intrare
    x0 = input('Introduceți x0: ');
    eps = input('Introduceți epsilon: ');
    itmax = input('Introduceți numărul maxim de iterații: ');

    it = 0;
    dif = inf;

    while dif > eps && it <= itmax
        x1 = x0 - f(x0) / fderiv(x0);
        dif = abs(x1 - x0);
        x0 = x1;
        it = it + 1;
    end

    if it > itmax && dif > eps
        fprintf('Nu s-a putut obține o aproximație în %d iterații cu eroarea %.6f\n', itmax, eps);
    else
        fprintf('Aproximația soluției în %d iterații cu eroarea %.6f este x ≈ %.6f\n', it, eps, x1);
    end
end
