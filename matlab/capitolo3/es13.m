format longe;
A = [1 3 2; 3 5 4; 5 7 6; 3 6 4; 1 4 2];
b = [15 28 41 33 22]';
D = diag(1:5);
solutions = [miaqr((D * A), (D * b)), (D * A) \ (D * b)];
disp(solutions)
disp(norm(solutions(1)));
solutions = [miaqr(A, b), A \ b];
disp(solutions);
disp(norm(solutions(1)));
