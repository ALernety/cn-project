function lx = polygrange(i, xi, x)
%myFun - Description
%
% Syntax: lx = polygrange(i, xi, x)
%
% Long description
c=xi;
ci=c(i);
c(i) = [];
lx = ones(size(x));
for k = 1:length(c)
    lx = lx.*(x-c(k));
end
lx = lx / prod(ci-c);
end