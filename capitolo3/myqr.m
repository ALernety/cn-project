function QR = myqr(A)
%   QR = myqr(A)
%   calcola la fattorizzazione QR di Householder della matrice A
%   Input:
%           A= matrice quadrata da fattorizzare 
%
%   Output:
%           QR=matrice contenente le informazioni sui fattori Q e R della
%           fattorizzazione QR di A
%
    [m,n] = size(A);
    if  n > m
        error('Dimensioni errate');
    end
    QR = A;
    for i = 1:n
        alfa = norm(QR(i:m,i));
        if alfa == 0
            error('la matrice non ha rango massimo');
        end
        if QR(i,i) >= 0
            alfa = -alfa;
        end
        v1 = QR(i,i) -alfa;
        QR(i,i) = alfa;
        QR(i+1:m,i) = QR(i+1:m,i)/v1;
        beta = -v1/alfa;
        v = [1; QR(i+1:m,i)];
        QR(i:m,i+1:n) = QR(i:m,i+1:n) - (beta * v) * (v' * QR(i:m,i+1:n));
    end
end