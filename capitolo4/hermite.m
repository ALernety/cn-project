function [y, df] = hermite(xi, fi, f1i, xx)
%
%
% Syntax: [y, df] = hermite(xi, fi, f1i, xx)
% Long description
m = length(xi);
if m ~= length(fi)
    error('dati inconsistenti');
end
for i = 1:m-1
    if any(find(xi(i+1:m) == xi(i)))
        error('ascisse non distinte');
    end
end
n = 2*m-1;
x(1:2:n) = xi(:);
x(2:2:n+1) = xi(:);
df(1:2:n) = fi(:);
df(2:2:n+1) = f1i(:);
for i = n:-2:3
    df(i) = (df(i) - df(i-2) / (x(i)-x(i-1)));
end
for i = 2:n
    for j = n+1:-1:i+1
    df(j) = (df(j) - df(j-1)) / (x(j)-x(j-i))
    end
end
y=df(n+1)*ones(size(xx));
for k = 0:n-1
    y = y.*(xx-x(n-k)) + df(n-k);
end
end