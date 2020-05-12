function I = trapecomp(f, a, b, n)
    %myFun - Description
    %
    % I = trapecomp(f, a, b)
    %
    % Approssimazione dell'integrale definito di f(x) con estremi a e b, 
    % mediante la formula composita di Simpson su n+1 ascisse equidistanti(n pari)
    if a==b
        I=0;
    elseif n < 2 || n/2 ~= fix(n/2)
        error('numero di ascisse non valido');
    else
        h=(b-a)/n;
        x=linspace(a, b, n+1);
        f = feval(f, x);
        I = (h/3) * (f(1) + f(n+1) + 4*sum(f(2:2:n)) + 2*sum(f(3:2:n-1)));
    end
    return
    end
