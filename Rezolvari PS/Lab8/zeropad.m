close all;
clear;
fs = 8000;
f1 = 2000;
f2 = 1000;
A1 = 1;
A2 = 0.5;
N = 8;
Z = 64;
 
t = 0:(N-1);
tt = 0:(Z-1);
s1 = A1*sin(2*pi*(f1/fs)*t);
s2 = A2*sin(2*pi*(f2/fs)*t);
 
%% Zero-pad the signals
s1 = [s1, zeros(1, Z-N)];
s2 = [s2, zeros(1, Z-N)];
s = s1 + s2;
 
 
%% Plot signals
h = figure;
plot(tt, s1, 'r--');
hold on;
plot(tt, s2, 'b-.');
plot(tt, s, 'k-');
xlabel('Sample index');
ylabel('Amplitude');
title('Two sinewaves');
legend('s1', 's2', 's1 + s2');
print(h, '-dpng', 'lab7_sinewaves_zeropad_b.png');
 
%% Compute/plot fft
ffs = fft(s);
fidx = (fs/Z)*linspace(0, Z-1, Z);
h = figure;
stem(fidx, abs(ffs));
title('FFT of signal');
xlabel('DFT frequency index');
print(h, '-dpng', 'lab7_sinewaves_zeropad_fft_b.png');