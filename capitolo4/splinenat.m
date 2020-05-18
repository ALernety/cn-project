function output=splinenat(x,y,xq)
%
% output=splinenat(x,y,xq)
%funzione che calcola la spline cubica naturale.
%Input: 
%   x=vettore delle ascisse su cui calcolare la spline
%   y=vettore dei valori di f(x), con x ascissa
%   xq= insieme delle ascisse di cui si vuole sapere il valore della spline
%Output:
%   output=vettore delle approssimazioni sulle ascisse xq
%
n=length(x);
l=length(xq);
if(length(y)~=n), error("dati in input con dimensioni differenti");end
[x1,i]=sort(x);
y1=y(i);
m=spline0(x1,y1);
h=diff(x1);
df = diff(y1)./h;
r=y(1 :(n-1))-((h(1:n-1).^2)/6)*m(2:n);
q=df(1:n-1)-h(1:n-1)*(m(2:n)-m(1:n-1));
output=zeros(l,1);
for i=1:l
  indg=find(xq(i)<=x1(2:n),1)+1;
  indp=find(xq(i)>=x1(1:n-1),1,'last');
  output(i)=(((xq(i)-x1(indp)).^3).*m(indg)+((x1(indg)-xq(i))^3).*m(indp))/(6*h(indp))+q(indp).*(xq(i)-x1(indp))+r(indp);
end
return
end