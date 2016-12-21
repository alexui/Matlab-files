
    

    function y=sys1(speed, e)
%SYS1 Simulates a signal system
%   [y] = SYS1(speed, e)
%   returns the current state (speed) after applying the input e

if abs(e) > 10
    k = 5;
else
    k = 1;
end
if e > 0
    y = speed + k;
elseif e < 0
    y = speed - k;
else
    y = speed;
end    