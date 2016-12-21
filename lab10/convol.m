function [y] = convol( x,h )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
    n = length(x);
    m = length(h);
    y = zeros(1, m);
    for i = 1 : n-m+1
        y(i) = h*x(i:i+m-1)';
    end

end

