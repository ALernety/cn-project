function x = qrsolve(QR, b)
%
%
%   x = qrSolve(QR, b)
%   risolve il sistema QR*x=b nel senso dei minimi quadrati.
%   Input:
%           QR=matrice contenente le informazioni Q e R della
%           fattorizzazione di una matrice quadrata A
%           b=termine noto del sistema lineare 
%   Output:
%           x=vettore delle soluzioni del sistema lineare
%

[m,n] = size(QR);
k = length(b);
if k ~= m
    error('Dati inconsistenti');
end
x=b(:);
for i = 1:n
    v=[1; QR(i+1:m,i)];
    beta = 2/(v'* v);
    x(i:m) = x(i:m) - beta*(v'*x(i:m))*v;
end
x=x(1:n);
for  j = n:-1:1
    if QR(j,j)==0
        error('Matrice singolare');
    end
    x(j) = x(j) / QR(j,j);
    x(1:j-1) = x(1:j-1) - QR(1:j-1,j)*x(j);
end
return
end