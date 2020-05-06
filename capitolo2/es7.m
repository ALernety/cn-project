f = @(x)(x^2*tan(x));
f1 = @(x)
m = 3;
x0 = 0;
for i=3:3:12
   [x_newt, it_newt] = newton(f, f1, x0, 10^(-i))
   [x_mod, it_mod] = newtonmod(f, f1, x0, m, 10^(-i))
   [x_aitken, it_aitken] = aitken(f, x0, x1, 10^(-i))
end    
