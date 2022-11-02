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

    isSuffAccurate = false;
    f0 = feval(f, x0);

    for i = 1:maxit
        f1 = feval(f, x1);
        df1 = (f1 - f0) / (x1 - x0);

        if df1 == 0
            warning([
                'Delta of f on iteration '
                int2str(i)
                ' is zero!'
                ]);
            break;
        end

        x0 = x1;
        x1 = x1 - (f1 / df1);
        f0 = f1;
        isSuffAccurate = abs(x1 - x0) <= tolx * (1 + abs(x0));

        if isSuffAccurate
            break;
        end

    end

    if ~isSuffAccurate
        warning([
            'Failed to converge in '
            maxit
            ' iterations!'
            ]);
    end

    x = x1;
end
