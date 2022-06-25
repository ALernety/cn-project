function [x, i] = secanti(f, x0, x1, tolx, maxit)
    % [x, i] = secanti(f, x0, x1, tolx, maxit)
    % Method of the secant, used to calculate a root of the equation f(x)=0
    % Input:  f     - function that we can derive
    %         x0    - initial approximation
    %         x1    - second initial approximation
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

    i = 0;
    f0 = feval(f, x0);

    for i = 1:maxit
        f1 = feval(f, x1);
        df1 = (f1 - f0) / (x1 - x0);
        x = x1 - (f1 / df1);

        if abs(x1 - x0) <= tolx * (1 + abs(x0))
            break;
        end

        x0 = x1;
        x1 = x;
        f0 = f1;

    end

    if abs(x - x0) > tolx * (1 + abs(x0))
        error('The method does not converge!');
    end

end
