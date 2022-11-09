format short;
matrixDimension = randi(3) + 2;
A = randi(10, matrixDimension, matrixDimension + 1 - randi(3));
b = randi(10, matrixDimension, 1);
solutions = [miaqr(A, b), A \ b];
disp(A);
disp(b);
format longe;
disp('Risposte');
disp(solutions);

format short;
matrixDimension = randi(3) + 2;
A = randi(10, matrixDimension, matrixDimension + 1 - randi(3));
b = randi(10, matrixDimension, 1);
solutions = [miaqr(A, b), A \ b];
disp(A);
disp(b);
format longe;
disp('Risposte');
disp(solutions);
