function [yp] = s1(cs, e)
   
    if e > 10
          yp = cs + 10;
      elseif e > 0 
          yp = cs + 1;
      elseif e == 0
          yp = cs;
    end
end