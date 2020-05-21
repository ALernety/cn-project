A = rot90(vander(1:10));
A = A(:,1:8);
x = (1:8);
x=x';
b = A*x;
A\b;
<<<<<<< HEAD
(A'*A)\(A'*b);
=======
a=(A'*A);
cond(a)
b1=(A'*b);
cond(b1)
c=a\b1;
cond(c)
>>>>>>> f3dff54f3d9c0d66387ec4852724e90bdc53b93f
