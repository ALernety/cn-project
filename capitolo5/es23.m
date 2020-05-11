
for i = 1:9
    c = ncweights(i);
    x = linspace(-1, 1.1, i+1)
    y = tan(x);
    in = sum(y.*c);
    h = 2.1/i;
    val = h*in
end