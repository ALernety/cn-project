function c = ncweights(n)
%
%
%  c = nc-weights(n)
%  calcola i pesi della formula di newton cotes di grado n;
% 	n-	grado
%	c-	pesi calcolati
%
if n<=0
    error('grado della formula non positivo');
end
nvalues = floor(n/2 + 1);
c=zeros(1,nvalues);
for j = 1:nvalues
    temp = (0:n);
    temp(j)=[];
    f = @(x)(prod(x-temp) /prod(j-1-temp));
    c(j) = integral(f, 0, n, 'ArrayValued', true);
end
c = [c flip(c)]; %sfrutto la simmetria dei pesi
if mod(n,2)==0
    %elimino la copia del valore centrale prodotta da flip(c) e che risulta di troppo per n pari
    c(n/2+1) = [];
end
return
end
