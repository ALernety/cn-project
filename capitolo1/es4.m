format longe;

space = logspace(-10, 10, 20);
result = zeros(length(space), 3);

for i = 1:length(space)
    result(i, :) = [space(i), es4_radice(space(i)), sqrt(space(i))];
end

disp(result);