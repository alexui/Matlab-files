function [] = ex2(n, f)
    
    f0 = 0;
    f1 = f;
    f2 = 2*f;
    f3 = f1+f2;
    
    f = [f0 f1 f2 f3];

    seq = zeros(1,n);
    for i = 1 : n
        seq(i) = randi(4) -1;
    end
    
    seq
    s = [];
    x = [];
    for i = 1 : n
        t = [0 : 0.01 : 1];
        
        if seq(i) < 3
            y = sin(2*pi*f(seq(i)+1)*t);
        else
            y1 = sin(2*pi*f(2)*t);
            y2 = sin(2*pi*f(3)*t);
            y = y1+y2;
        end
        x = [x t+(i-1)];
        s = [s y];
    end
    
    plot(x,s);
end