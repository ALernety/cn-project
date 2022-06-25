function x = mialu(A, b)
    % x = mialu(A, b)
    % Method of the secant, used to calculate a root of the equation f(x)=0
    % Input:  A     - a matrix rapresentation of the equations with unknown variables
    %         b     - result of unknown variables
    % Output: x     - array to what equals unknown variables

    % Calculate L and U matrixes
    n = length(A);
    L = zeros(n);
    U = zeros(n);
    % P = eye(n);

    for k = 1:n
        % find the entry in the left column with the largest abs value (pivot)
        [~, r] = max(abs(A(k:end, k)));
        r = n - (n - k + 1) + r;

        A([k r], :) = A([r k], :);
        % P([k r], :) = P([r k], :);
        L([k r], :) = L([r k], :);
        b([k r], :) = b([r k], :);

        % from the pivot down divide by the pivot
        L(k:n, k) = A(k:n, k) / A(k, k);

        U(k, 1:n) = A(k, 1:n);
        A(k + 1:n, 1:n) = A(k + 1:n, 1:n) - L(k + 1:n, k) * A(k, 1:n);

    end

    U(:, end) = A(:, end);

    x = zeros(n, 1);
    y = zeros(n, 1);

    % calcolo delle soluzioni di Ly = b
    for i = 1:1:n
        alpha = 0;

        for k = 1:1:i
            alpha = alpha + L(i, k) * y(k);
        end

        y(i) = b(i) - alpha;
    end

    % calcolo delle soluzioni di Ux = y
    for i = n:-1:1
        alpha = 0;

        for k = i + 1:1:n
            alpha = alpha + U(i, k) * x(k);
        end

        x(i) = (y(i) - alpha) / U(i, i);
    end

end
