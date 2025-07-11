% successiveSolve.m
% Rezolvă x = g(x) prin metoda aproximărilor succesive
function x = successiveSolve(g, x0, eps, itmax)
    x = x0;
    for k = 1:itmax
        x_new = g(x);
        if abs(x_new - x) <= eps
            x = x_new;
            return;
        end
        x = x_new;
    end
    error('Nu s-a atins precizia în %d iterații pentru ε = %g', itmax, eps);
end