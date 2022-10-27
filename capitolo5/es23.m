syms x;

f = @(x) sin(pi .* x.^2);
f_t = @(x) f(x) + 10^(-1) * rand(size(x));
n = 1e4;
m = [1:15];
x = ((0:n) / n);
err = ones(1, 15);

for i = 1:15
    p = polyfit(x, f_t(x), i);
    y = polyval(p, x);
    err (i) = norm(y - f(x), Inf);
end

semilogy(m, err);
xlabel("m");
ylabel("||f - p||");
