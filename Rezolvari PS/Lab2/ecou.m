
    

    load('voice.mat');
sound(y);
pause(3);
plot(y);
l = length(y);
d = 500;
y2 = zeros(length(y), 1);
y2(d+1:end,1) = y(1:l-d);
y3 = y + y2;
sound(y3, 8000);
figure;
plot(1:l, [y';y2';y3']);