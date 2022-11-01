function answer = radice(x)
    % answer = radice(x)
    % This method is called Babilons method
    % It gets some value in input and apply the Babilons method
    % until I needed precision, but we need maximum precision possible,
    % so I apply this method until I get two equal values
    % one before another and this will mean this method arrived at a point,
    % in which value not changes, so it is a maximum precision.
    % INPUT:  x      - Is a value of which we want to get square root
    % OUTPUT: answer - This is the square root of the input
    format long e;

    if x < 0
        error('Wrong value in input! Should be not less then zero!');
    end

    answer = x / 2;
    guess = x;

    while answer ~= guess
        guess = answer;
        answer = (guess + (x / guess)) / 2;
    end

end
