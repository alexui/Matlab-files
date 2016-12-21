function [] = ex1()
    t = linspace(0,1,128);
    
    f1 = 1;
    f2 = 2;
    f3 = 10;
    f4 = 20;
    f5 = 100;
    
    f = [f1, f2, f3, f4, f5];
    
    for i = 1: 5
  
        y = zeros(1,128);
        y(1) = sin(2*pi*f(i)*1/128);
        y(2) = sin(2*pi*f(i)*2/128);
        y(3) = sin(2*pi*f(i)*3/128);
        y(4) = sin(2*pi*f(i)*4/128);

        for k = 5 : 128
           y(k) = 0.2 * (sin(2*pi*f(i)*k/128) + ...
                        sin(2*pi*f(i)*(k-1)/128) + ...
                    sin(2*pi*f(i)*(k-2)/128) + ...
                    sin(2*pi*f(i)*(k-3)/128) + ...
                    sin(2*pi*f(i)*(k-4)/128));
        end

        figure;
        plot(t,y, t,sin(2*pi*f(i)*t));
    end
      
    
end