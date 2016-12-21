
    

    clear;
close all;

%% Generate an ideal-filter sequence (in freq domain)
N = 256;
kc = N/16;
HK = zeros(1, N);
HK(1:kc) = 1;
HK(end-kc+2:end) = 1;
h = figure;
fx = linspace(0,1,N);
plot(fx, HK);
xlabel('Frequency (x Fs)');
title('Ideal low-pass filter');
print(h, '-dpng', 'ideal_filter.png');

%% Obtain time-domain sequence
hk = ifftshift(ifft(HK));
figure;
plot(1:N, hk);
xlabel('Index');
title('Time-domain sequence of ideal low-pass filter');

%% Generate windowed time-domain sequence
% window = rect
L = 65;
w = ones(1, L);
hw = hk(N/2+1-floor(L/2):N/2+1+floor(L/2)) .* w;
h = figure;
plot(1:L, hw);
xlabel('Sample index');
title('Windowed filter sequence h(k) using rect(n)');

%% Obtain frequency-domain of windowed sequence
HW = fft(hw);
figure;
fx = linspace(0,1,L);
plot(fx, abs(HW));
xlabel('Frequency (x Fs)');
title('FFT of the time-domain sequence with w(n)=rect(n)');

%% Generate windowed time-domain sequence
% window = blackman
L = 65;
w = blackman(L)';
hw = hk(N/2+1-floor(L/2):N/2+1+floor(L/2)) .* w;
h = figure;
plot(1:L, hw);
xlabel('Sample index');
title('Windowed filter sequence h(k) using blackman(n)');

%% Obtain frequency-domain of windowed sequence
HW = fft(hw);
figure;
fx = linspace(0,1,L);
plot(fx, abs(HW));
xlabel('Frequency (x Fs)');
title('FFT of the time-domain sequence with w(n)=blackman(n)');

%% Use the sequence to filter a sinewave
fs = 64000;
N = 64;
M = length(hw);
x = 0:(N-1);
f = 2500;
A = 1;
xn = A*sin(2*pi*f/fs*x);
yn = conv(xn, hw);
h = figure;
stem(x, xn, 'b');
hold on;
stem(x, yn(M/2:length(yn)-M/2), 'r');
xlabel('Sample index');
legend('xn', 'yn');
title('Filtering using hw');