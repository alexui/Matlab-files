function [] = ex4(filename,T)
    
    load(filename);
   % sound(y);
    N = length(y);
    yt = [zeros(1,T), y(1:N-T)'];
    sound(y+yt');

end