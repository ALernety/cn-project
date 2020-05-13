function x = chebyshev(a, b, n)
%
%  x = chebyshev(a, b, n)
%
%Calcola le ascisse di chebyshev per il polinomio interpolante di grado n
%su [a,b]
if a >= b || n ~=fix(n) || n < 0
    error('Dati errati');
end
x = (a+b)/2 +((b-a)/2)*cos((2*(0:n)+1)*(pi/(2*n+2)));
x = flip(x);
end