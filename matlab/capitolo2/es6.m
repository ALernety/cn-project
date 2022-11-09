syms x;
f = @(x)(x - cos((pi / 2) * x));
f1 = matlabFunction(diff(f, x));

x0 = 1;
x1 = 9.9e-1;
x = zeros(4, 3);
y = zeros(4, 3);

for i = 3:3:12
    [x(i / 3, 1), y(i / 3, 1)] = newton(f, f1, x0, 10^(-i));
    [x(i / 3, 2), y(i / 3, 2)] = secanti(f, x0, x1, 10^(-i));
    [x(i / 3, 3), y(i / 3, 3)] = steffensen(f, x0, 10^(-i));
end

row_names = {'newton', 'secanti', 'steffensen'};
disp(x)
figure
plot([3, 6, 9, 12], y, 'o-')
title('iterazioni richieste per la convergenza al diminuire di tolx')
xlabel('tolleranza = 10^{-x}')
ylabel('iterazioni')
legend(row_names, 'Location', 'northwest')
