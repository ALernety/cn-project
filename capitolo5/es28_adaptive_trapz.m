function [In, err, nfeval] = adaptive_trapz(fx, a, b, tol, fx_a, fx_b)
    % [If , err , neval] = adaptive_trapz(fx, a, b, tol, fx_a, fx_b)
    % Calculates approximation of an integral of the function fx
    % via adaptive recursive trapeziodal formula.
    % Input:  fx     - function to integrate
    %         a      - inital point of integrated interval,
    %                  must be less then b
    %         b      - final point of integrated interval,
    %                  must be greather then a
    %         tol    - precision required (default is a 1e-3)
    %         fx_a   - result of the function fx with "a" as variable
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

    if nargin <= 4
        fx_a = fx(a);
        fx_b = fx(b);
        nfeval = 2;
    end

    h = b - a;
    x = (a + b) / 2;
    fx_1 = feval(fx, x);
    nfeval = nfeval + 1;
    In_prev = .5 * h * (fx_a + fx_b);
    In = .5 * (In_prev + h * fx_1);
    err = abs(In - In_prev) / 3;

    if err > tol
        new_tol = tol / 2;
        [fx_left, err_left, nfeval_left] = ...
            es28_adaptive_trapz(fx, a, x, new_tol, fx_a, fx_1);
        [fx_right, err_right, nfeval_right] = ...
            es28_adaptive_trapz(fx, x, b, new_tol, fx_1, fx_b);
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
