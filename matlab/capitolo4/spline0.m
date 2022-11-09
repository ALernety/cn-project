function s = spline0(x, y, xq)
    % s = spline0(x, y, xq)
    % The values of s are determined by natural cubic spline method
    % of interpolation of x and y
    % Input:  x     - x-coordinates vector
    %         y     - function values at x-coordinates
    %         xq    - query points
    % Output: s     - interpolated values at query points

    n = length(x);
    l = length(xq);

    if n ~= length(y)
        error('Size of coordinates vector and function values are not match!');
    end

    if unique(x) ~= x
        error('x-coordinates vector are not distinct!');
    end

    x = x(:);
    y = y(:);
    [x, index] = sort(x);
    y = y(index);
    % Order the abscissas in ascending order
    h_i = diff(x);
    m = n - 1;
    df = diff(y) ./ h_i;
    hh = h_i(1:m - 1) + h_i(2:m);
    rhs = 6 * diff(df) ./ hh;
    phi = h_i(1:m - 1) ./ hh;
    csi = h_i(2:m) ./ hh;
    d = 2 * ones(m - 1, 1);
    phi = phi(2:m - 1);
    csi = csi(1:m - 2);
    m_i = tridiag_gauss(phi, d, csi, rhs);
    m_i = [0; m_i; 0];
    r = y(1:m) - ((h_i(1:m).^2) / 6) .* m_i(1:m);
    q = df(1:m) - ((h_i(1:m) / 6) .* (m_i(2:n) - m_i(1:m)));
    s = zeros(1, l);

    for i = 1:l
        indp = find(xq(i) >= x(1:m), 1, 'last');
        indg = indp + 1;
        s(i) = ( ...
            ((xq(i) - x(indp)).^3) .* m_i(indg) + ...
            ((x(indg) - xq(i)).^3) .* m_i(indp) ...
        ) / (6 * h_i(indp)) + q(indp) .* (xq(i) - x(indp)) + r(indp);
    end

end
