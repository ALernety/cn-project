function N = newton(x, y, xq)
    % N = newton(x, y, xq)
    % The values of L are determined by Newton's method interpolation
    % of x and y
    % Input:  x     - x-coordinates vector
    %         y     - function values at x-coordinates
    %         xq    - query points
    % Output: N     - interpolated values at query points
    n = length(x);

    if n ~= length(y)
        error('Size of coordinates vector and function values are not match!');
    end

    if unique(x) ~= x
        error('x-coordinates vector are not distinct!');
    end

    div_diff = y;

    for i = 1:n - 1

        for j = n:-1:i + 1
            div_diff(j) = (div_diff(j) - div_diff(j -1)) / (x(j) - x(j - i));
        end

    end

    N = div_diff(n);

    for i = n - 1:-1:1
        N = N .* (xq - x(i)) + div_diff(i);
    end

end
