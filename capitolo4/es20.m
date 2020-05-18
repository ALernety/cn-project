f = @(x)(cos((pi*x.^2)/2));
fp = @(x)(f(x) + 10^(-3)*rand(size(x)));
xi = -1 + 2*(0:10^4)/10^4;
fi = f(xi);
fpi = fp(xi);
errors=zeros(1, 20);
for m = 1:20
    y = minimiquadrati(xi, fpi, m);
    errors(m) = norm(abs(y-fi), inf);
end
semilogy(errors);
xlabel('grado del polinomio');
ylabel('errore di interpolazione massimo');