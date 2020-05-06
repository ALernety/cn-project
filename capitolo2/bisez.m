function [x,i] = bisez(f,a,b,tolx)
    %
    % [x, i] = bisez(f, a, b, tolx)
    % calcola la radice di f(x) utilizzando il metodo di bisezione sull'intervallo [a, b]
    format long e
    fa = feval(f,a);
    fb = feval(f,b);
    if(fa * fb > 0 )
        error('gli estremi  hanno lo stesso segno');
    end
    imax =  ceil(log2(b-a) - log2(tolx));
    for i = 1:imax
        x = (a+b)/2;
        fx = feval(f,x);
        f1x = abs((fb-fa)/(b-a));
        if abs(fx) <= tolx*f1x
            break
        elseif fa*fx<0
            b = x;
            fb = fx;
        else
            a = x;
            fa = fx;
        end
    end
    
end