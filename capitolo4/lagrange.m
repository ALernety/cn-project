function y = lagrange(xi, fi, x)
%
% y = lagrange(xi, fi, x)
% calcola la forma di lagrange del polinomio interpolante
% sulle coppie(xi,fi), valutato nei punti del vettore x
% 
n = length(xi);
if n ~= length(fi)
    error('dati inconsistenti');
end
for i = 1:n-1
    if any(find(xi(i+1:n) == xi(i)))
        error('ascisse non distinte');
    end
end
y=zeros(size(x));
for i = 1:n
    y = y + fi(i) * polygrange(i,xi,x);
end
return    
end