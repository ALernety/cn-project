syms x;

fx = @(x) sin(1 ./ (0.1 + x));
a = 0;
b = 1;
grades = [1 2 3 4 5 6 7 9];
tols = [1e-2 1e-3 1e-4 1e-5 1e-6];

nevals = zeros(length(grades), length(tols));

for n = 1:length(grades)

    for t = 1:length(tols)
        [~, ~, nevals(n, t)] = composita(fx, a, b, grades(n), tols(t));
    end

end

disp(nevals);

figure();
plot(grades, log(nevals'), '-o');
xlabel('grado');
ylabel('iterazioni = e^{x}');
legend(num2str(tols'));
