f = @(x)(x-cos(x));
f1 = @(x)(1+sin(x));

x0 = 0;
x1 = 1;
x=zeros(4,4)
y= zeros(4, 4);
for i=3:3:12
   [x(1, i/3), y(1, i/3)] = bisez(f, x0, x1, 10^(-i));
   [x(2, i/3), y(2, i/3)] = newton(f, f1, x0, 10^(-i));
   [x(3, i/3), y(3, i/3)] = corde(f, f1, x0, 10^(-i));
   [x(4,i/3), y(4, i/3)] = secanti(f, x0, x1, 10^(-i), 100);
end
row_names = {'bisezione', 'newton', 'corde', 'secanti'}
colnames = {'10^-3','10^-6','10^-9','10^-12'}
sTable = array2table(y,'RowNames',row_names,'VariableNames',colnames)
l = linspace(1, 4, 4)    
plot(l, y')
