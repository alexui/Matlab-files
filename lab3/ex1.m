function [x,y] = ex1(A, T)

    y = zeros(1, T);
    x = (1:1:T);
    for i = 1:T
        if i <= T/2
            y(i) = A;
        else
            y(i) = -A;
        end
    end

end