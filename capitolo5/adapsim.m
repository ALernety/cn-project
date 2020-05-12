function [I2, points] = adapsim(f, a, b, tol, fa, f1, fb)
    %
    %
    % Syntax: [I2, points] = adapsim(f, a, b, tol, fa, f1, fb)
    %
    % 
    global points
    delta = 0.5;
    x1 = (a+b)/2;
    if nargin<=4
        fa = feval(f, a );
        fb = feval(f, b );
        f1 = feval(f, x1);
        if nargout==2
            points = [a fa;x1 f1; b fb];
        else
            points = [];
        end
    end
    h = (b-a)/6;
    x2 = (a+x1)/2;
    x3 = (x1+b)/2;
    f2 = feval(f, x2);
    f3 = feval(f, x3);
    if ~isempty(points)
        points = [points; [x2 f2; x3 f3]];
    end
    I1 = h*(fa+fb+4*f1);
    I2 = .5*h*(fa+4*f2+2*f1+4*f3+fb);
    e = abs(I2-I1)/15;
    if e>tol || abs(b-a) > delta
        I2 = adapsim(f, a, x1, tol/2, fa, f2, f1) + adapsim(f, x1, b, tol/2, f1, f3, fb);
    end
    return
    end