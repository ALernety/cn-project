function [If, err, nfeval] = composita(fun, a, b, n, tol)
    % [If , err , neval] = composita(fun, a, b, n, tol)
    % Calculates approximation of an integral of the function fun
    % via composed Newton-Cotes formula of the grade n.
    % Input:  fun    - function to integrate
    %         a      - inital point of integrated interval,
    %                  must be less then b
    %         b      - final point of integrated interval,
    %                  must be greather then a
    %         n      - grade of Newton-Cotes formula
    %         tol    - precision required (default is a 1e-3)
    % Output: If     - Approximation of the integral, of function fun
    %         err    - Estimation of the squaring error
    %         nfeval - Number of iterations

    if nargin < 4
        error("Not enaugh arguments!");
    end

    if n < 1
        error("Grade of the Newto-Cotes formula is wrong!");
    end

    if a > b
        error("'a' must be less then 'b'!");
    end

    if nargin < 5
        tol = 1e-3;
    end

    tol = abs(tol);
    err = tol + 1;
    mu = 1 + mod(n, 2);
    weight = es24_NewtonCotesWeights(n);
    k = n;
    x = linspace(a, b, k + 1);
    fx = fun(x);
    h = (b - a) / k;
    If1 = h * sum(fx(1:n + 1) .* weight(1:n + 1));

    while tol < err
        k = k * 2;
        x = linspace(a, b, k + 1);
        fx(1:2:k + 1) = fx(1:1:k / 2 + 1);
        fx(2:2:k) = fun(x(2:2:k));
        h = (b - a) / k;
        If = 0;

        for i = 1:n + 1
            If = If + h * sum(fx(i:n:k)) * weight(i);
        end

        If = If + h * fx(k + 1) * weight(n + 1);
        err = abs(If - If1) / (2^(n + mu) -1);
        If1 = If;
    end

    nfeval = length(fx);
end
