function coeff = NewtonCotesWeights(n)
    % coeff = NewtonCotesWeights(n)
    % Calculates quadrature weights based on Newton-Cotes formula of grade n.
    % Input:  n     - grade of Newton-Cotes formula
    % Output: coeff - squared weights

    coeff = zeros(1, n);

    for i = 0:n

        d = [0:i - 1, i + 1:n];
        den = prod(i - d);
        a = poly(d);
        a = [a ./ (n + 1:-1:1) 0];
        num = polyval(a, n);
        coeff(1, i + 1) = num / den;

    end

end
