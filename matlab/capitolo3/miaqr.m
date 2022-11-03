function [x, nr] = miaqr(A, b)
    % Syntax: [x, nr] = miaqr(QR, b)
    % Calculates Q and R matrixes and find solution for the matrix A
    % using these matrixes.
    % Input:    A   - a matrix rapresentation of the equations with unknown variables
    %           b   - result of unknown variables
    % Output:   x   - array of unknown variables
    %           nr  - a norm, of the corresponding residual vector

    [m, n] = size(A);

    if n > m
        error('Number of rows should be greather or equal then number of columns!');
    end

    if length(b) ~= m
        error('Size of b not match with number of rows!');
    end

    % Start with R=A
    R = A;
    % Set Q as the identity matrix
    Q = eye(m);

    for k = 1:n - 1
        v = zeros(m, 1);
        v(k:m, 1) = R(k:m, k);
        g = norm(v);

        if g == 0
            error('la matrice non ha rango massimo');
        end

        if 0 > R(k, k)
            g = -g;
        end

        v(k) = v(k) + g;
        % Orthogonal transformation matrix that eliminates one element
        % below the diagonal of the matrix it is post-multiplying:
        s = norm(v);

        if s ~= 0, w = v / s; u = 2 * R' * w;
            % Product HR
            R = R - w * u';
            % Product QR
            Q = Q - 2 * Q * (w * w');
        end

    end

    c = Q' * b;

    x = R \ c;
    nr = A * x - b;

end
