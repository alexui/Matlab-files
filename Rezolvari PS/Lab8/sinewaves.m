close all;
clear;
fs = 8000;
f1 = 0000;
f2 = 2500;
A1 = 1;
A2 = 0.5;
N = 8;
 
t = 0:(N-1);
s1 = A1*sin(2*pi*(f1/fs)*t);
s2 = A2*sin(2*pi*(f2/fs)*t);
s = s1 + s2;
 
%% Plot signals
h = figure;
plot(t, s1, 'r--');
hold on;
plot(t, s2, 'b-.');
plot(t, s, 'k-');
xlabel('Sample index');
ylabel('Amplitude');
title('Two sinewaves');
legend('s1', 's2', 's1 + s2');
print(h, '-dpng', 'lab7_sinewaves_c.png');
 
 
%% Compute/plot fft
ffs = fft(s);
fidx = (fs/N)*linspace(0, N-1, N);
h = figure;
stem(fidx, abs(ffs));
title('FFT of signal');
xlabel('DFT frequency index');
print(h, '-dpng', 'lab7_sinewaves_c_fft.png');