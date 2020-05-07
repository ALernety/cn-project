f = @(x)(x^2*tan(x));
f1 = @(x)(2*x*tan(x) +(x^2)\(cos(x).^2))
m = 2;
x0 = 1;
y= zeros(3, 4)
for i=3:3:12
   [x, y(1, i/3)] = newton(f, f1, x0, 10^(-i))
   [x, y(2, i/3)] = newtonmod(f, f1, x0, m, 10^(-i))
   [x, y(3, i/3)] = aitken(f, f1, x0, 10^(-i))
end    
loglog(y')