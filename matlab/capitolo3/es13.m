%Codice esercizio 13

A= [1, 2, 3; 1 2 4; 3 4 5; 3 4 6; 5 6 7];
b=[14 17 26 29 38];
QR=myqr(A);
ris=qrsolve(QR,b);
disp(ris);
