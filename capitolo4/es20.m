f = @(x)(cos((pi*x.^2)/2));
fp = @(x)(f(x) + 10^(-3)*rand(size(x)));
xi = -1 + 2*(0:10^4)/10^4;
fi = f(xi);
fpi = fp(xi);
errors=zeros(1, 20);
for m = 1:20
    p = polyfit(xi,fpi, m);
    y = polyval(p, xi);
    errors(m) = norm(abs(y-fi), inf);
end
semilogy(errors);