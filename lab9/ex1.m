close all;
s = load('notes_signal.mat');
N = length(s.notes_signal);

ff = fft(s.notes_signal);
figure;
x = linspace(0, s.fs/2, N/2);
ff = ff(1:N/2);
stem(x, abs(ff));
xlabel('DFT freq index');
ylabel('FFT of signal');
title('DFT');

%ex4
win1 = hanning(N)';
xw1 = win1.*s.notes_signal;
ffhn = fft(xw1);
figure
stem(x, abs(ffhn(1:N/2)));

%ex3
figure
signal_pad = [s.notes_signal(1:N),zeros(1,500)];
plot(signal_pad);
ff2 = fft(signal_pad);
x = linspace(0, 500, N + 500);
figure
stem(x, abs(ff2));
xlabel('DFT freq index');
ylabel('FFT of signal');
title('DFT');

ff = fft(s.notes_signal);
figure;
x = linspace(0, s.fs/2, N/2);
ff = ff(1:N/2);
stem(x, abs(ff));
xlabel('DFT freq index');
ylabel('FFT of signal');
title('DFT');

%ex4
win2 = hamming(N)';
x = linspace(0, s.fs/2, N/2);
xw2 = win2.*s.notes_signal(1:N);
ffhm = fft(xw2);
figure
stem(x, abs(ffhm(1:N/2)));


