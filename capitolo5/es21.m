syms x;
format longe;

EQU = 1;
CHEB = 2;

fx = @(x)(1 ./ (2 .* (2 .* x.^2 - 2 .* x + 1)));
dfx = matlabFunction(diff(fx, x));
n = [4 8 16 24 32 40];
a = -2;
b = 3;
error_list = zeros(length(n), 10);
error_list(:, 1) = n;
xq = linspace(a, b, 10001);
fxq = fx(xq);

step = 0;

for n_i = n

    step = step + 1;
    space = {linspace(a, b, n_i); es19_chebyshev(n_i, a, b)};

    approx = es16_lagrange(space{EQU}, fx(space{EQU}), xq);
    error_list(step, 1) = max(abs(fxq - approx));
    approx = es16_lagrange(space{CHEB}, fx(space{CHEB}), xq);
    error_list(step, 2) = max(abs(fxq - approx));

    approx = es17_newton(space{EQU}, fx(space{EQU}), xq);
    error_list(step, 3) = max(abs(fxq - approx));
    approx = es17_newton(space{CHEB}, fx(space{CHEB}), xq);
    error_list(step, 4) = max(abs(fxq - approx));

    approx = es18_hermite(space{EQU}, fx(space{EQU}), dfx(space{EQU}), xq);
    error_list(step, 5) = max(abs(fxq - approx));
    approx = es18_hermite(space{CHEB}, fx(space{CHEB}), dfx(space{CHEB}), xq);
    error_list(step, 6) = max(abs(fxq - approx));

    approx = es20_spline0(space{EQU}, fx(space{EQU}), xq);
    error_list(step, 7) = max(abs(fxq - approx));
    approx = es20_spline0(space{CHEB}, fx(space{CHEB}), xq);
    error_list(step, 8) = max(abs(fxq - approx));

    approx = spline(space{EQU}, fx(space{EQU}), xq);
    error_list(step, 9) = max(abs(fxq - approx));
    approx = spline(space{CHEB}, fx(space{CHEB}), xq);
    error_list(step, 10) = max(abs(fxq - approx));

end

figure(1);
method = ["Lagrange"; "Newton"; "Hermite"; "spline0"; "spline"];
spaces = ["Equidistant"; "Chebyshev"];

for space = [EQU CHEB]

    subplot(2, 1, space);
    plot(n, log(error_list(:, space:2:end)), "-o");
    xlabel('numero di punti');
    ylabel('errore = e^{x}');
    title(spaces(space, :));
    legend(method, 'Location', 'northwest');

end

disp(error_list);
