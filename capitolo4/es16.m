f = @(x)(cos((pi*x.^2)/2));
f1 = @(x)(-pi*x.*sin((pi*x.^2)/2))
x = linspace(-1, 1, 100001);
linerrors = zeros(1, 20);
chebyerrors = zeros(1, 20);
for n = 1:20
    xlin = linspace(-1, 1, n);
    xcheby = chebyshev(-1,1,n);
    ylin = hermite(xlin,f(xlin),f1(xlin),x);
    ycheby = hermite(xcheby,f(xcheby),f1(xcheby),x);
    errlin = abs(f(x) - ylin);
    errcheby = abs(f(x) - ycheby);
    linerrors(n) = max(errlin);
    chebyerrors(n) = max(errcheby);
end
semilogy(linerrors);
hold on;
semilogy(chebyerrors);