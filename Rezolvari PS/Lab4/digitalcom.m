%% Frquency modulation using two frequencies
close all;
k1 = 1;
k2 = 2;
T = 1;
f1 = k1/T;
f2 = k2/T;
t = 0:T/100:T;
s1 = sin(2*pi*f1*t);
s2 = sin(2*pi*f2*t);
values = randi([0 3], 1, 10);
nv = length(values);
s = [];
for i=1:nv
    si = zeros(1,length(s1));
    if mod(values(i), 2) == 1
        si = si + s1;
    end
    if values(i) > 1
        si = si + s2;
    end
    s = [s, si];
end
tt = length(s);
x = ((1:tt) - 1) * nv / tt;
h1 = figure;
plot(x, s);
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Frequency modulated signal');
print(h1, '-dpng', 'freqmod.png');
fprintf('The transmitted values are:\n');
values