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

    while not(answer == guess)
        guess = answer;
        answer = (guess + (x / guess)) / 2;
    end

end

for i = 1:0.5:10
    s = 1e-10 + 1e10 * log10(i);
    custom = radice(s);
    native = sqrt(s);

    if abs(custom - native) >= eps(abs(native))

        if abs(custom - native) > eps(abs(native))
            diff = abs(custom - native);
            fprintf([ ...
                    'result is not equal for %.' int2str(abs(int16(log10(eps(s)))) + 1) ...
                    'd, with values custom=%.' int2str(abs(int16(log10(eps(custom)))) + 20) ...
                    'd and native=%.' int2str(abs(int16(log10(eps(native)))) + 20) ...
                    'd, with diff=%.' int2str(abs(int16(log10(eps(diff)))) + 20) 'd\n' ...
                ], s, custom, native, diff);
        elseif abs(custom - native) == eps(abs(native))
            fprintf([ ...
                    'Difference betwen this numbers are equal to exponent ' ...
                    'for this numbers, and equals to %.30d\n'...
                ], eps(abs(native)));
        end

    end

    fprintf([ ...
            'custom=%.' int2str(abs(int16(log10(eps(custom)))) + 1) ...
            'd\nnative=%.' int2str(abs(int16(log10(eps(native)))) + 1) ...
            'd\n\n'
        ], custom, native);

end
