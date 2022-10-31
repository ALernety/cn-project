function [In, err, nfeval] = adaptive_simpson(fx, a, b, tol, fx_a, fx_mid, fx_b)
    % [If , err , neval] = adaptive_simpson(fx, a, b, tol, fx_a, fx_b)
    % Calculates approximation of an integral of the function fx
    % via adaptive recursive Simpson formula.
    % Input:  fx     - function to integrate
    %         a      - inital point of integrated interval,
    %                  must be less then b
    %         b      - final point of integrated interval,
    %                  must be greather then a
    %         tol    - precision required (default is a 1e-3)
    %         fx_a   - result of the function fx with "a" as variable
    %                  (Not required)
    %         fx_mid - result of the function fx with "(a + b) / 2" as variable
    %                  (Not required)
    %         fx_b   - result of the function fx with "b" as variable
    %                  (Not required)
    % Output: If     - Approximation of the integral, of function fx
    %         err    - Estimation of the squaring error
    %         nfeval - Number of iterations

    if nargin < 3
        error("Not enaugh arguments!");
    end

    if a > b
        error("'a' must be less then 'b'!");
    end

    if nargin < 4
        tol = 1e-3;
    end

    nfeval = 0;
    x_mid = (a + b) / 2;

    if nargin <= 4
        fx_a = fx(a);
        fx_b = fx(b);
        fx_mid = fx(x_mid);
        nfeval = 3;
    end

    h = (b - a) / 6;
    x_left = (a + x_mid) / 2;
    x_right = (x_mid + b) / 2;
    fx_left = feval(fx, x_left);
    fx_right = feval(fx, x_right);
    nfeval = nfeval + 2;
    In_prev = h * (fx_a + 4 * fx_mid + fx_b);
    In = .5 * h * (fx_a + 4 * fx_left + 2 * fx_mid + 4 * fx_right + fx_b);
    err = abs(In - In_prev) / 15;

    if err > tol
        new_tol = tol / 2;
        [fx_left, err_left, nfeval_left] = ...
            es29_adaptive_simpson(fx, a, x_mid, new_tol, fx_a, fx_left, fx_mid);
        [fx_right, err_right, nfeval_right] = ...
            es29_adaptive_simpson(fx, x_mid, b, new_tol, fx_mid, fx_right, fx_b);
        In = fx_left + fx_right;
        nfeval = nfeval + nfeval_left + nfeval_right;
        % Both values of err is positive, so to compensate
        % the error I'll divide err on last step
        err = abs(err_left + err_right);
        return;
    end

    % Compensate sum of two positive errors
    err = err / 2;
end
