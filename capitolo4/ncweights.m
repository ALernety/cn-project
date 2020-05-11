function c = ncweights(n)
%myFun - Description
%
% Syntax: c = nc-weights(n)
%
% Long description
if n<=0
    error('grado della formula non positivo');
end
values = [0:n];
c=0*[0:n/2];
for j = 1:(ceil((n+1)/2))
    temp = values;
    vj = temp(j);
    temp(j)=[];
    f = @(x)(prod(x-temp) /prod(vj-temp));
    c(j) = integral(f, 0, n, 'ArrayValued', true);
end

c = [c flip(c)];
if mod(n,2)==0
    c(n/2+1) = [];
end
return
end