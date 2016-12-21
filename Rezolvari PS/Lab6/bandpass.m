fs = 8000;
f1 = 3000;
ts = 1/fs;
xi = 0:ts:100*ts;
x1 = cos(2*pi*f1*xi);
 
% Plot x1
figure
stem(xi, x1, 'ro');
 
% Show FFT of x1
N = 64;
k = fs/N; % Fundamental frequency
X1 = fft(x1, N);
xf = 0:k:fs/2;
figure
stem(xf, abs(X1(1:N/2+1)));
xlabel('Frequency [Hz]');
ylabel('Amplitude');
title('Spectrum of x1');