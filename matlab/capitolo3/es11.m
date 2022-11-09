format longe;
[A1, b1] = linsis(10, 1, 1);
[A10, b10] = linsis(10, 10, 1);
disp('Condizionamento:');
disp([cond(A1) cond(A10)]);
disp('Risultato:');
disp(mialdl(A1, b1));
disp(mialdl(A10, b10));
