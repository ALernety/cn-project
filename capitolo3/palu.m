function [LU,p]=palu(A)
% [LU,p]=palu(A)
% funzione che dato in input matrice A restituisce matrice fattorizzata LU
% e il relativo vettore p di permutazione di LU con pivoting parziale di A
% input:
%   A= matrice di cui si vuole calcolare la fattorizzazione lu con pivoting
%   parziale
% output:
%   LU=matrice quadrata di dimensioni n*n, composta dalla matrice 
%   triangolare superiore U e la matrice triangolare inferiore a diagonale
%   unitaria L
%   p= vettore di permutazione di dimensione n, generato dalla 
%   fattorizzazione di A con pivoting parziale
%

[n,m]=size(A);
if(n~=m)
    error("matrice A non quadrata");
end
LU=A;
p=[1:n];
for i=1:n-1
    [mi,ki]=max(abs(LU(i:n,i)));
    if mi==0
        error('La matrice e'' non singolare')
    end
    ki=ki+i-1;
    if ki>i
        p([i ki])=p([ki i]);
       LU([i ki],:)= LU([ki i],:);
    end
    LU(i+1:n,i)=LU(i+1:n,i)/LU(i,i);
    LU(i+1:n,i+1:n)=LU(i+1:n,i+1:n)-LU(i+1:n,i)*LU(i,i+1:n);
end
return 
end

    