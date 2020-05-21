A = rot90(vander(1:10));
A = A(:,1:8);
x = (1:8);
x=x';
b = A*x;
A\b;
(A'*A)\(A'*b);