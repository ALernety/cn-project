format short;
matrixDimension = randi(5);
A = randi(10, matrixDimension);
b = randi(10, matrixDimension, 1);
solutions = [mialu(A, b), A\b];
disp(A);
disp(b);
format longe;
disp(solutions);

format short;
matrixDimension = randi(5);
A = randi(10, matrixDimension);
b = randi(10, matrixDimension, 1);
solutions = [mialu(A, b), A\b];
disp(A);
disp(b);
format longe;
disp(solutions);
