function H = hermite(x, y, dx_i, xq)
    % H = hermite(x, y, dx_i, xq)
    % The values of L are determined by Newton's method interpolation
    % of x and y
    % Input:  x     - x-coordinates vector
    %         y     - function values at x-coordinates
    %         dx_i  - i derivates of function values at x-coordinates
    %         xq    - query points
    % Output: H     - interpolated values at query points
    n = length(x);
    step_between_values = size(dx_i)(1) + 1;

    if n ~= length(y) || n ~= size(dx_i)(2)
        error('Size of coordinates vector and function values are not match!');
    end

    if unique(x) ~= x
        error('x-coordinates vector are not distinct!');
    end

    div_diff_size = step_between_values * n;
    % grade of interpolated polinomial
    m = div_diff_size - 1;
    z = zeros(div_diff_size, 1);
    df = z;

    % first column of the table
    for i = 1:1:step_between_values
        z(i:step_between_values:div_diff_size) = x(:);
        df(i:step_between_values:div_diff_size) = y(:);
    end

    columns_to_calc = [step_between_values + 1:step_between_values:m];
    % next columns of the table
    for i = 1:1:div_diff_size

        for j = div_diff_size:-1:i + 1
            % If 'j' is not in 'columns_to_calc',
            % then get value from derivate
            % else calculate the value
            if ~ismember(j, columns_to_calc)
                dy_index = ceil(j / step_between_values);
                df(j) = dx_i(i, dy_index) / factorial(i);
            else
                df(j) = (df(j) - df(j - 1)) / (z(j) - z(j - i));
                columns_to_calc = unique([columns_to_calc j + 1]);
            end

        end

    end

    H = df(div_diff_size) * ones(size(xq));

    for k = 0:m - 1
        H = H .* (xq - z(m - k)) + df(m - k);
    end

end
