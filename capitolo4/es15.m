f = @(x)(cos((pi*x.^2)/2));
x = linspace(-1, 1, 100001);
linerrors = zeros(1, 40);
chebyerrors = zeros(1, 40);
for n = 1:40
    xlin = linspace(-1, 1, n);
    xcheby = chebyshev(-1,1,n);
    ylin = lagrange(xlin,f(xlin),x);
    ycheby = lagrange(xcheby,f(xcheby),x);
    errlin = abs(f(x) - ylin);
    errcheby = abs(f(x) - ycheby);
    linerrors(n) = max(errlin);
    chebyerrors(n) = max(errcheby);
end
semilogy(linerrors);
hold on;
semilogy(chebyerrors);