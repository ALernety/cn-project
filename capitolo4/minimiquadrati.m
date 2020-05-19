function y = minimiquadrati(xi, fi, m)
%
%
%  y = minimiquadrati(xi, fi, m)
%  calcola il valore del polinomio di approssimazione ai minimi quadrati di grado m
% sulle ascisse xi. fi contiene i valori approssimati di una funzione f valutata su xi
if length(unique(xi)) < m+1
    error('ascisse distinte non sufficienti');
end
fi = fi(:);
V = fliplr(vander(xi));
V = V(1:end, 1:m+1);
QR = myqr(V);
p = qrsolve(QR, fi);
y = p(m+1)*ones(size(xi));
for i = 0:m-1
    y = y.*xi+p(m-i);
end
end