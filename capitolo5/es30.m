syms x;

fx = @(x) sin(1 ./ (0.01 + x));
a = 0;
b = 1;
tols = [1e-2 1e-3 1e-4 1e-5 1e-6];

nevals = zeros(2, length(tols));

for tol = 1:length(tols)
    [~, ~, nevals(1, tol)] = es28_adaptive_trapz(fx, a, b, tols(tol));
    [~, ~, nevals(2, tol)] = es29_adaptive_simpson(fx, a, b, tols(tol));
end

disp(nevals);

figure();
plot(tols, log(nevals'), '-o');
xlabel('toleranza');
ylabel('iterazioni = e^{x}');
legend(['adattivo trapezi'; 'adattivo Simpson']);
