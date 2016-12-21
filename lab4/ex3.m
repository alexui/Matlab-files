function [] = ex3(A, T, N, f)
    
    delta = T/5;
    x = 1:T;
    s = zeros(1, T);
    s(1:floor(delta)) = A;
    plot(x,s);
    figure
    
    
    ck = zeros(1,N);
    
    for i = 1 : N
       ck(i) = (delta/T) * A * exp(-1i*pi*(i/T)*delta) * sinc((pi*i*delta)/T); 
    end
    
    k = 1:N;
    stem(k,abs(ck));
    
    
    
    
end