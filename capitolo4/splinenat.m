function output=splinenat(X,Y,QX)
%
%
%
%
%
pp=spline0(X,Y);
if nargin == 2
    output = pp;
else
    output = ppval(pp,QX);%questo non funziona
end