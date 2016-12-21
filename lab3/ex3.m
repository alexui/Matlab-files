function sum = ex3(coef, ka, t, T)
    n = length(coef);
    sum = 0;
    for k = 1:n
        sum = sum + coef(k) * exp((1j*2*pi*ka(k)*t)/T);
    end     
end