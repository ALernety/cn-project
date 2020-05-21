function output=splinenat(xi,fi,xq)
%
% output=splinenat(x,y,xq)
%funzione che calcola la spline cubica naturale.
%Input: 
%   xi=vettore delle ascisse su cui calcolare la spline
%   fi=vettore dei valori di f(x), con x ascissa
%   xq= insieme delle ascisse di cui si vuole sapere il valore della spline
%Output:
%   output=vettore delle approssimazioni sulle ascisse xq
%

m = length(xi);
l=length(xq);

if m~=length(fi), 
    error("dati errati"); 
end
for i = 1:m-1
    if any( find(xi(i+1:m)==xi(i)) ),
        error("ascisse non distinte"), 
    end
end
xi = xi(:);
fi = fi(:);
[xi,ind] = sort(xi); 
fi = fi(ind);
% ordino le ascisse in modo crescente
hi = diff(xi);
n= m-1;
df = diff(fi)./hi;
hh = hi(1:n-1)+hi(2:n);
rhs = 6*diff(df)./hh;
phi = hi(1:n-1)./hh;
csi = hi(2:n)./hh;
% = 1-phi;
d= 2*ones(n-1,1);
phi = phi(2:n-1);
csi = csi(1:n-2);
mi = trisolve( phi, d, csi, rhs );
mi = [0;mi;0];
r=fi(1:n)-((hi(1:n).^2)/6).*mi(1:n);
q=df(1:n)-((hi(1:n)/6).*(mi(2:m)-mi(1:n)));
output=zeros(l,1);
for i=1:l
    indp=find(xq(i)>=xi(1:n),1,'last');
    indg=indp+1;
    output(i)=((((xq(i)-xi(indp)).^3).*mi(indg)+((xi(indg)-xq(i)).^3).*mi(indp))/(6*hi(indp)))+q(indp).*(xq(i)-xi(indp))+r(indp);
end
return
end