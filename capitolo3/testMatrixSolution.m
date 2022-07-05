function testMatrixSolution(A, solution)
    % Syntax: testMatrixSolution(A, solution)
    % The function tests calculates result of A with solution as variables
    % Input:  A        - a matrix rapresentation of the equations with unknown variables
    % Output: prints the result of A with soulutions as variables
    matrixDimension = size(A)(1);

    for j = 1:1:matrixDimension;
        total = 0;

        for i = 1:1:matrixDimension;
            total = total + (A(j, i) * solution(i));
        end;

        disp(total);
    end

end
