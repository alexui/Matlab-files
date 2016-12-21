function y=ramp(N)
%RAMP Returns a ramp signal of a given number of smaples
%   [y] = RAMP(N)
%   returns the ramp signal for the given samples
 
y = zeros(1, N);
for t=1:N
    y(t) = t-1;
end