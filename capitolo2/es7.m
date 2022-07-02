syms x;
f = @(x)((x - cos((pi / 2) * x))^3);
f1 = matlabFunction(diff(f, x));

x0 = 1;
x1 = 9.9e-1;
x = zeros(4, 3);
y = zeros(4, 3);
colnames = {};

for i = 3:3:12
    colnames{end + 1} = ['10^-' num2str(i)];
    [x(i / 3, 1), y(i / 3, 1)] = es5_newton(f, f1, x0, 10^(-i));
    [x(i / 3, 2), y(i / 3, 2)] = es5_secanti(f, x0, x1, 10^(-i));
    [x(i / 3, 3), y(i / 3, 3)] = es5_steffensen(f, x0, 10^(-i));
end

row_names = {'newton', 'secanti', 'steffensen'};
disp(x)
figure
plot([3, 6, 9, 12], y, 'o-')
title('iterazioni richieste per la convergenza al diminuire di tolx')
xlabel('tolleranza = 10^{-x}')
ylabel('iterazioni')
legend(row_names, 'Location', 'northwest')
