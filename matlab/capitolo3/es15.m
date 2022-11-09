syms x1 x2 x3;

x = zeros(6, 3);
y = zeros(3, 2);

fn1 = @(x1, x2) [
    (x1.^2 + 1) * (x2 - 2);
    exp(x1 - 1) + exp(x2 - 2) - 2
    ];
fn2 = @(x1, x2, x3) [
    x1 - x2 * x3;
    exp(x1 + x2 + x3 - 3) - x2;
    x1 + x2 + 2 * x3 - 4
    ];

for i = 3:5:13
    n = (i - 3) / 5 + 1;
    jacobian_x = matlabFunction(jacobian(sym(fn1)));
    [x(n, 1:2), y(n, 1)] = newton(fn1, jacobian_x, zeros(1, 2), 10^(-i));
    jacobian_x = matlabFunction(jacobian(sym(fn2)));
    [x(n + 3, 1:3), y(n, 2)] = newton(fn2, jacobian_x, zeros(1, 3), 10^(-i));
end

disp(x');
figure();
plot([3, 8, 13], y, 'o-');
title('iterazioni richieste per la convergenza al diminuire di tol');
xlabel('tolleranza = 10^{-x}');
ylabel('iterazioni');
legend(['f_1(x)'; 'f_2(x)'], 'Location', 'northwest');
