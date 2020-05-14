function [y,df] = hermite( xi, fi, f1i, xx )
    %
    % [y,df] = hermite( xi, fi, f1i, xx ) Calcola il valore del polinomio
    % interpolante di Hermite sulle
    % ascisse xi. I vettori fi e f1i
    % contengono i corrispondenti valori della f e della sua ferivata prima.
    % Se specificato, df contiene il vettore delle differenze divise.
    %
    % controlli sui dati di ingresso
    %
    m = length(xi);
    if m~=length(fi) || m~=length(f1i)
        error('dati inconsistenti');
    end
    for i = 1:m-1
        if any( find(xi(i+1:m)==xi(i)) )
            error('ascisse non distinte')
        end
    end
    n = 2*m-1; % grado del polinomio interpolante
    x = zeros(n+1,1);
    df = x;
    x(1:2:n) = xi(:);
    x(2:2:n+1) = xi(:);
    df(1:2:n) = fi(:);
    df(2:2:n+1) = f1i(:);
    for i = n:-2:3 % seconda colonna della tabella
        df(i) = ( df(i)-df(i-2) )/( x(i)-x(i-1) );
    end
    for i = 2:n % colonne successive della tabella
        for j = n+1:-1:i+1
            df(j) = ( df(j)-df(j-1) )/( x(j)-x(j-i) );
        end
    end
    
    1
    
    % calcolo il polinomio interpolante nelle ascisse prescritte
    %
    y = df(n+1)*ones(size(xx));
    for k = 0:n-1
        y = y.*( xx-x(n-k) ) +df(n-k);
    end
    return
    end