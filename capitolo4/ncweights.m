function f = ncweights(n)
%myFun - Description
%
% Syntax: c = nc-weights(n)
%
% Long description
c=zeros(n);
a=linspace(0, n);
for j = n:-1:ceil(n/2)
    f = @(x)((prod(x-[0:n])) /(sum(n-[0:n])) )
    
end
end