syms x;
format longe;

fx = @(x) exp(1).^(3 .* x);
a = 0;
b = 1;
ifx = integral(fx, a, b);
n_list = [1 2 3 4 5 6 7 9];
errors = zeros(length(n_list), 1);
i = 0;
weights = {};

for k = n_list
    weights = [weights{:}, {NewtonCotesWeights(k)}];
end

for weight = weights
    n = length(weight{1}) - 1;
    h = (b - a) / n;
    approx_ifx = 0;

    for k = 0:n
        approx_ifx = approx_ifx + (weight{1}(k + 1) * fx(a + (k * h)));
    end

    approx_ifx = approx_ifx * h;
    i = i + 1;
    errors(i) = abs(ifx - approx_ifx);
end

figure();
semilogy(n_list, errors, '-o');
xlabel("grado");
ylabel('errore');

disp(errors);
