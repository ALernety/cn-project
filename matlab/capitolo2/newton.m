function [x, i] = newton(f, f1, x0, tolx, maxit)
    % [x, i] = newton(f, f1, x0, tolx, maxit)
    % Newton's method, used to calculate a root of the equation f(x)=0
    % Input:  f     - function that we can derive
    %         f1    - derived function of the 'f'
    %         x0    - initial approximation
    %         tolx  - tolerance
    %         maxit - maximum number of iterations (default = 100)
    % Output: x     - the approximation of the root function
    %         i     - number of iterations
    % CHECK THIS: bisezione, corde, secanti, aitken, newtonmod

    format long e;

    if nargin < 4
        error('Number of arguments must be at least 4!');
    elseif nargin == 4
        maxit = 100;
    end

    if tolx < eps
        error('Tolerance cannot be checked!');
    end

    precisionEnough = false;

    for i = 1:maxit
        fx = feval(f, x0);
        f1x = feval(f1, x0);

        if f1x == 0
            warning(['Value of f1 on iteration ' int2str(i) ' is zero!']');
            break;
        end

        x = x0 - (fx / f1x);

        precisionEnough = abs(x - x0) <= tolx * (1 + abs(x0));

        if precisionEnough
            break;
        end

        x0 = x;

    end

    if ~precisionEnough
        warning(['Failed to converge in ' maxit ' iterations!']);
    end

end
