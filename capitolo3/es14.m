A = rot90(vander(1:10));
A = A(:,1:8);
x = (1:8);
x=x';
b = A*x;
cond(A)
A\b;
a=(A'*A);
cond(a)
b1=(A'*b);
cond(b1)
c=a\b1;
cond(c)