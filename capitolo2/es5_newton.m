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

    x = x0;

    for i = 1:maxit
        fx = feval(f, x);
        f1x = feval(f1, x);
        x = x - fx / f1x;

        if abs(x - x0) <= tolx * (1 + abs(x0))
            break;
        end

        x0 = x;
    end

    if abs(x - x0) > tolx * (1 + abs(x0))
        error('The method does not converge!');
    end

end
