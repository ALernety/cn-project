syms x;
format longe;

fx_sin = @(x)(sin(2 .* pi .* x));
fx_cos = @(x)(cos(2 .* pi .* x));
n = [5:5:50];
a = 0;
b = 1;
error_list = zeros(length(n), 4);
error_list(:, 1) = n;
xq = linspace(a, b, 10001);
fxq_sin = fx_sin(xq);
fxq_cos = fx_cos(xq);

step = 0;

for n_i = n

    step = step + 1;
    space = linspace(a, b, n_i);

    approx = spline0(space, fx_sin(space), xq);
    error_list(step, 1) = max(abs(fxq_sin - approx));
    approx = spline(space, fx_sin(space), xq);
    error_list(step, 2) = max(abs(fxq_sin - approx));

    approx = spline0(space, fx_cos(space), xq);
    error_list(step, 3) = max(abs(fxq_cos - approx));
    approx = spline(space, fx_cos(space), xq);
    error_list(step, 4) = max(abs(fxq_cos - approx));

end

figure(1);
method = ["spline0 sin"; "spline sin"; "spline0 cos"; "spline cos"];
plot(n, log(error_list), "-o");
xlabel('numero di punti');
ylabel('errore = e^{x}');
legend(method, 'Location', 'southwest');

disp(error_list);
