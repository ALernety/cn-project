format longe;
[A1, b1] = linsis(10, 1);
[A10, b10] = linsis(10, 10);
solutions = [mialu(A1, b1), mialu(A10, b10)];
disp(solutions);
disp('Condizionamento:');
disp([cond(A1) cond(A10)]);
