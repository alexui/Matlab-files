function [c,y] = ex2(cmax, A)
   y = zeros(1,cmax*2);
   c = (-cmax:1:cmax);
   n = length(c);
   for k = 1:n
       if mod(c(k),2) == 0
           y(k) = 0;
       else
           y(k) = 2*A/(pi*1i*c(k));
       end
   end
end