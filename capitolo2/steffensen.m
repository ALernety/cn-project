function [x, i] = steffensen(f, x0, tolx, maxit)
    % [x, i] = steffensen(f, x0, tolx, maxit)
    % Steffensen's method, used to calculate a root of the equation f(x)=0
    % Input:  f     - a fixed point iteration function
    %         x0    - initial guess to the fixed point
    %         tolx  - tolerance
    %         maxit - maximum number of iterations (default = 100)
    % Output: x     - the approximation of the root function
    %         i     - number of iterations
    % CHECK THIS: bisezione, corde, secanti, aitken, newtonmod

    format long e;

    if nargin < 3
        error('Number of arguments must be at least 3!');
    elseif nargin == 3
        maxit = 100;
    end

    precisionEnough = false;

    for i = 1:maxit
        % get ready to do a large, but finite, number of iterations.
        % This is so that if the method fails to converge, we won't
        % be stuck in an infinite loop.
        fx = feval(f, x0); % calculate the next two guesses for the fixed point.
        f_fx_x = feval(f, fx + x0);

        if (f_fx_x - fx) == 0
            warning(['Distance betwen two guesses on iteration ' int2str(i) ' is zero!']);
            break;
        end

        x = x0 - (fx^2 / (f_fx_x - fx));
        % use Aitken's delta squared method to
        % find a better approximation to x0.
        precisionEnough = abs(x - x0) <= tolx * (1 + abs(x0));

        if precisionEnough
            break; % if we are, stop the iterations, we have our answer.
        end

        x0 = x;

    end

    if ~precisionEnough
        warning(['Failed to converge in ' int2str(maxit) ' iterations!']);
    end

end
