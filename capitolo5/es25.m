format long e
f = @(x)(1/(1+100*x.^2));
a = -1;
b = 1;
itrap = zeros(1, 5);
isimp = zeros(1, 5);
for i = 1:5
    itrap(i) = adaptrap(f, a, b, 10^(-i-1));
    isimp(i) = adapsim(f, a, b, 10^(-i-1));
end
integrali = [itrap; isimp];
row_names = {'trapezi adattiva', 'simpson adattiva'};
colnames = {'10^-2','10^-3','10^-4','10^-5','10^-6'};
values = array2table(integrali,'RowNames',row_names,'VariableNames',colnames);
disp(values);