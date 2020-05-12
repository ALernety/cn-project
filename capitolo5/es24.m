a = -1;
b = 1.1;
n = 200;
itrap = zeros(1, n);
isimp = zeros(1, n);
for i = 1:n
    itrap(i) = trapecomp(@tan, a, b, i);
    isimp(i) = simpcomp(@tan, a, b, 2*i);
end