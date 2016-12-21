close all;
s = load('notes_signal_long.mat');
N = length(s.notes_signal);

figure;
plot(s.notes_signal);

ff = fft(s.notes_signal);
figure;
x = linspace(0, s.fs/2, N/2);
ff = ff(1:N/2);
stem(x, abs(ff));
xlabel('DFT freq index');
ylabel('FFT of signal');
title('DFT');

win1 = hanning(N)';
xw1 = win1.*s.notes_signal;
ffhn = fft(xw1);
figure
stem(x, abs(ffhn(1:N/2)));

