T = 100;
s = zeros(1 , T);
t = linspace(1,T,T);

A = 2;
for i = 1 : T
    if i < T/2
        s(i) = A;
    else
        s(i) = -A;
    end
end

plot(s);