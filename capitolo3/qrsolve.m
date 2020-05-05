function x = qrSolve(QR, b)
%
%
% x = qrSolve(QR, b)
% risolve il sistema QR*x=b nel senso dei minimi quadrati
%
[m, n] = size(QR);
k = length(b);
if k ~= n
    error('Dati inconsistenti');
end
x=b(:);
for i = 1:n
    v=[1; QR(i+1:m,i)];
    beta = 2/(v'*v);
    x(i:m) = x(i:m) - (beta*(v'*x(i:m))*v);
end
x=x(1:n);
x = trisup(QR, x);
return
end