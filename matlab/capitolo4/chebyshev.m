function C = chebyshev(n, a, b)
    % C = chebyshev(a, b, n)
    % The values of C are determined by Chebyshev's method of calculation
    % abscissas for the interpolating polynomial of degree n on [a, b]
    % Input:  n     - interpolating polynomial grade
    %         a     - inital point of interval on which to calculate
    %                 the abscissa of chebyshev
    %         b     - final point of interval on which to calculate
    %                 the abscissa of chebyshev. Should be greather of a
    % Output: C     - vector of the abscissa of Chebyshev

    if a >= b || n ~= fix(n) || n < 0
        error('Dati errati');
    end

    C = (a + b) / 2 + ((b - a) / 2) * cos((2 * (0:n) + 1) * pi / (2 * n + 1));
    C = flip(C);
end
