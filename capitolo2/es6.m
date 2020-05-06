f = @(x)(x-cos(x));
f1 = @(x)(1+sin(x));

x0 = 0;
x1 = 1;
for i=3:3:12
   [x_bisez, it_bisez] = bisez(f, x0, x1, 10^(-i))
   [x_newt, it_newt] = newton(f, f1, x0, 10^(-i))
   [x_corde, it_corde] = corde(f, f1, x0, 10^(-i))
   [x_secanti, it_secanti] = secanti(f, x0, x1, 10^(-i), 100)
end    

