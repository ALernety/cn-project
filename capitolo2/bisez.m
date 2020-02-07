function x = bisez(f,a,b,tolx)
    imax =  ceil(log2(b-a) - log2(tolx));
    fa = feval(f,a);
    fb = feval(f,b);
    if(fa * fb > 0 )
        error('Il metodo di bisezione non puo essere utilizzato in questo caso!')
    end
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