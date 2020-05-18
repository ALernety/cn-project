function y = minimiquadrati(xi, fi, m)
%myFun - Description
%
% Syntax: y = mini(input)
%
% Long description
if length(unique(xi)) < m+1
    error('ascisse distinte non sufficienti');
end
fi = fi(:);

V = fliplr(vander(xi));
V = V(1:end, 1:m+1);
QR = myqr(V);
p = qrsolve(QR, fi);
y = p(m+1)*ones(size(xi));
for i = 0:m-1
    y = y.*xi+p(m-i);
end
end