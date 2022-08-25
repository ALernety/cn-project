function L = lagrange(x, y, xq)
    % L = lagrange(x, y, xq)
    % The values of L are determined by Lagrange's method interpolation
    % of x and y
    % Input:  x     - x-coordinates vector
    %         y     - function values at x-coordinates
    %         xq    - query points
    % Output: L     - interpolated values at query points
    n = length(x);

    if n ~= length(y)
        error('Size of coordinates vector and function values are not match!');
    end

    if unique(x) ~= x
        error('x-coordinates vector are not distinct!');
    end

    L = zeros(size(xq));

    for i = 1:n
        x_without_i = x;
        xi = x(i);
        x_without_i(i) = [];
        l = 1;

        for k = 1:length(x_without_i)
            l = l .* (xq - x_without_i(k));
        end

        l = l / prod(xi - x_without_i);
        L = L + y(i) * l;
    end

end
