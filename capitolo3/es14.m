A = rot90(vander(1:10));
A = A(:,1:8);
x = (1:8);
x=x';
b = A*x;
cond(A)
A\b;
a=(A'*A);
cond(a)
rcond(a)
b=(A'*b);
cond(b)
rcond(b)
c=a\b;
cond(c)