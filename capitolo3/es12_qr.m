function [x, nr] = miaqr(A, b)
    %   QR = myqr(A)
    %   calcola la fattorizzazione QR di Householder della matrice A
    %   Input:
    %           A= matrice quadrata da fattorizzare
    %
    %   Output:
    %           QR=matrice contenente le informazioni sui fattori Q e R della
    %           fattorizzazione QR di A
    %
    [m, n] = size(A);

    if n > m
        error('Dimensioni errate');
    end

    if length(b) ~= m
        error('Dati inconsistenti');
    end

    QR = A;

    for i = 1:n
        alfa = norm(QR(i:m, i));

        if alfa == 0
            error('la matrice non ha rango massimo');
        end

        if QR(i, i) >= 0
            alfa = -alfa;
        end

        v1 = QR(i, i) -alfa;
        QR(i, i) = alfa;
        QR(i + 1:m, i) = QR(i + 1:m, i) / v1;
        beta = -v1 / alfa;
        v = [1; QR(i + 1:m, i)];
        QR(i:m, i + 1:n) = QR(i:m, i + 1:n) - (beta * v) * (v' * QR(i:m, i + 1:n));
    end

    [m, n] = size(QR);
    k = length(b);

    if k ~= m
        error('Dati inconsistenti');
    end

    x = b(:);

    for i = 1:n
        v = [1; QR(i + 1:m, i)];
        beta = 2 / (v' * v);
        x(i:m) = x(i:m) - beta * (v' * x(i:m)) * v;
    end

    x = x(1:n);

    for j = n:-1:1

        if QR(j, j) == 0
            error('Matrice singolare');
        end

        x(j) = x(j) / QR(j, j);
        x(1:j - 1) = x(1:j - 1) - QR(1:j - 1, j) * x(j);
    end

end

%{

A = round (10 * rand (3))
b = round (10 * rand (3, 1))

%}
