function x = chebyshev(a, b, n)
%
%  x = chebyshev(a, b, n)
%
%  Calcola le ascisse di chebyshev per il polinomio interpolante di grado n
%  su [a,b]
%
%  Input:
%        a,b= intervallo su cui calcolare le ascisse di chebyshev, con a<b
%        n= grado del polinomio interpolante
%
%  Output:
%         x=vettore delle ascisse di chebyshev
%
if a >= b || n ~=fix(n) || n < 0
    error('Dati errati');
end
x = (a+b)/2 +((b-a)/2)*cos((2*(0:n)+1)*(pi/(2*n+2)));
x = flip(x);
end