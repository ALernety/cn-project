a = -1;
b = 1.1;
n = 20;
itrap = zeros(1, n);
isimp = zeros(1, n/2);
for i = 1:n
    itrap(i) = trapecomp(@tan, a, b, i);
end

for i = 2:2:n
    isimp(i/2) = simpcomp(@tan, a, b, i);
end