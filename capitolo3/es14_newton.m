function [x, nit] = newton(fun, jacobian, x0, tol, maxit)
    % [x, nit] = newton(fun, jacobian, x0, tol, maxit)
    % Newton's method, used to calculate non linear systems solutions
    % Input:  fun       - array of functions, 
    %                     should have input as variables, but not an array
    %                     Working example:
    %                         @(x1,x2) [x1-x2; x1+x2]
    %                     Wrong example:
    %                         @(x) [x(1)-x(2); x(1)+x(2)]
    %         jacobian  - jacobian matrix of the functions in variable 'fun'
    %         x0        - array of initail values
    %         tol       - tolerance                     (default = 1e-6)
    %         maxit     - maximum number of iterations  (default = 100)
    % Output: x         - solution of non linear system
    %         nit       - number of iterations executed
    % CHECK THIS: bisezione, corde, secanti, aitken, newtonmod

    if nargin < 5, maxit = 100; end
    if nargin < 4, tol = 10^ - 6; end

    if tol < eps
        error('Tollerance is smaller then precision of the computer!');
    end

    x = num2cell(x0);
    fun_x = feval(fun, x{:});

    for nit = 1:maxit
        jacobian_x = feval(jacobian, x{:});
        H = jacobian_x \ fun_x;
        x = num2cell(cell2mat(x) - H');
        fun_x = feval(fun, x{:});
        % norm of matrix 'fun_x' corresponds to the precison of solution
        if norm(fun_x) < tol, break, end
    end

    x = cell2mat(x);

end
