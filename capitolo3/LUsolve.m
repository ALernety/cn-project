function x=LUsolve(LU,p,b)
%
% funzione che risolve il sistema lineare LUx=b(p):
%input:
%   LU=matrice quadrata (n*n) fattorizzata LU, ottenuta attrarso la
%   fattorizzazione con pivoting parziale
%   p= vettore di permutazione per b, di dimensione n, con valori da (1 a
%   n)
%   b=vettore dei termini noti
%output:
%   x=vettore delle incognite calcolate
%
%
   [m,n]=size(LU);
   if(m~=n || n~=length(b)) error('dati incosistenti')
   else if(min(abs(diag(LU)))==0)
           error("fattorizzazione errata");
       end
   end
    x=b(p);
    for i=1:n-1
        x(i+1:n)=x(i+1:n)-(LU(i+1:n,i)*x(i));
    end
       x(n)=x(n)/LU(n,n);
       for i=n-1:-1:1
           x(1:i)=x(1:i)-(LU(1:i,i+1)*x(i+1));
           x(i)=x(i)/LU(i,i);
       end
    return
end