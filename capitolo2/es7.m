f = @(x)(x^2*tan(x));
f1 = @(x)(2*x*tan(x) +(x^2)/(cos(x).^2));
m = 3;
x0 = 1;
y= zeros(3, 4);
x=-1*ones(3,4);
for i=3:3:12
  [x(1, i/3), y(1, i/3)] = newton(f, f1, x0, 10^(-i));
  [x(2, i/3), y(2, i/3)] = newtonmod(f, f1, x0, m, 10^(-i));
  [x(3:i/3), y(3, i/3)] = aitken(f, f1, x0, 10^(-i), 200);
end
disp(x);
disp(y);
row_names = {'newton', 'newton modificato', 'aitken'};
colnames = {'10^-3','10^-6','10^-9','10^-12'};
values = array2table(x,'RowNames',row_names,'VariableNames',colnames)

format
iterations = array2table(y,'RowNames',row_names,'VariableNames',colnames)
plot([3, 6, 9, 12], y','-')
title('iterazioni richieste per la convergenza al diminuire di tolx')
xlabel('tolleranza = 10^{-x}')
ylabel('iterazioni')
legend({'newton','newtonmod','aitken'},'Location','northwest')