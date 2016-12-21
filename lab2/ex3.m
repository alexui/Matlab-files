function []=ex3()
    
    t = [0, pi/6, pi/4, pi/3, pi/2];
    tp = -t;
    figure
    plot(exp(1i*t), 'ro');
    
    hold on
    plot(exp(-1i*t), 'b+');
    
    hold on
    ss = (exp(1i*t)+exp(-1i*t))/2;
    plot(real(ss), imag(ss) ,'g*')
    
    
    
    figure
    plot(real(ss), imag(ss) ,'g*')

end