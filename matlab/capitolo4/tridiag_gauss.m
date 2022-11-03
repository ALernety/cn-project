function x = tridiag_gauss(phi, d, csi, b)
    % x = tridiag_gauss(phi, d, csi, b)
    % Solves a tridiagonal system using Gaussian elimination.
    % Input:  phi   - Elements vector on the main diagonal (n elements).
    %         d     - Elements vector on the diagonal below the main
    %                 diagonal (n elements, first element is not used).
    %         csi   - Elements vector on the diagonal above the main
    %                 diagonal (n elements, last element is not used).
    %         b     - Right-hand side vector (n elements).
    % Output: x     - Solution vector (n elements).

    n = length(d);
    x = b;

    for i = 1:n - 1
        phi(i) = phi(i) / d(i);
        d(i + 1) = d(i + 1) - phi(i) * csi(i);
        x(i + 1) = x(i + 1) - phi(i) * x(i);
    end

    x(n) = x(n) / d(n);

    for i = n - 1:-1:1
        x(i) = (x(i) - csi(i) * x(i + 1)) / d(i);
    end

end
