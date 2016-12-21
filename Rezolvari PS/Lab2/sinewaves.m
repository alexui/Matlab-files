
    

    %% Sinewaves
close all;
f1 = 1800;
f2 = 1600;
fm = 200;
tm = 1/fm;
x = 0:tm/100:tm;
s1 = sin(2*pi*f1*x);
s2 = sin(2*pi*f2*x);
h1 = figure;
plot(x, [s1; s2]);
xlabel('Time (s)');
ylabel('Amplitude');
title('Two sinewaves');
legend('1800 Hz', '1600 Hz');
print(h1, '-dpng', 'sines.png');