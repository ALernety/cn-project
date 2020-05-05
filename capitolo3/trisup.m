function x = trisup(A, b)
    %
    % x= trisup(A, b) 
    %risolve il sistema triangolare superiore Ax=b memorizzato per colonne
    %
    %
    [m, n] = size(A);
    if m ~= n 
        error('Matrice non quadrata');
    end
    x= b(:);
    for  j = n:-1:1
        if A(j,j)==0
            error('Matrice non singolare');
        end
        x(j) = x(j) / A(j,j);
        x(1:j-1) = x(1:j-1) - A(1:j-1,j)*x(j);
    end
    return
end