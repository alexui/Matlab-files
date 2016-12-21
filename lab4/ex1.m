function [sp,ck, rms] = ex1(A, T)
    
    x = 0:T-1;
    s = -A*ones(1, T);
    s(1:(T/2)) = A;
    plot(x,s);
    
    ck = zeros(1,T);
    for k = 1:T
       if mod(s(k),2) == 0
           ck(k) = 0;
       else
           ck(k) = 2*A/(pi*1i*x(k));
       end
    end
   
 %   stem(x,abs(ck.^2));
    
    rms = zeros(1, T);
    
    for k = 1: T
                
            ss = ck(k:T) * ck (k:T)';
       
        rms(k) = sqrt(2*ss);
    end
    
    
    hold on
    plot(x, rms, 'g');
    
    c = find(rms < 0.03);
    n = length(c);
    
    sp = zeros(1, T);
    c(1)
    
    for t = 0 : T-1
        sum = 0;
        for k = 1:c(1)
            sum = sum + ck(k) * exp((1j*2*pi*k)*(t/T)) - ck(k) * exp((-1j*2*pi*k)*(t/T));
        end
        sp(t+1) = sum;
    end
    
    t = 0 : T-1;
    hold on
    plot(t, sp, 'r');
end