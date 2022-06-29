syms x;
f = @(x)(x - cos((pi / 2) * x));
f1 = matlabFunction(diff(f, x));

x0 = 1;
x1 = 9.9e-1;
x = zeros(3, 4);
y = zeros(3, 4);
colnames = {};

for i = 3:3:12
    colnames{end + 1} = ['10^-' num2str(i)];
    [x(1, i / 3), y(1, i / 3)] = es5_newton(f, f1, x0, 10^(-i));
    [x(2, i / 3), y(2, i / 3)] = es5_secanti(f, x0, x1, 10^(-i));
    [x(3, i / 3), y(3, i / 3)] = es5_steffensen(f, x0, 10^(-i));
end

row_names = {'newton', 'secanti', 'steffensen'};
values = array2table(x, 'RowNames', row_names, 'VariableNames', colnames);
disp(values)
figure
plot([3, 6, 9, 12], y', 'o-')
title('iterazioni richieste per la convergenza al diminuire di tolx')
xlabel('tolleranza = 10^{-x}')
ylabel('iterazioni')
legend(row_names, 'Location', 'northwest')
