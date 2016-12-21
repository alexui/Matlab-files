
    

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

%% Filter a sinewave using the low-pass filter
fs = 64000;
N = 64;
x = 0:(N-1);
f = 3000;
A = 1;
xn = A*sin(2*pi*f/fs*x);
yn = conv(xn, hw);
h = figure;
stem(x, xn, 'b');
hold on;
stem(x, yn(1:N), 'r');
xlabel('Sample index');
legend('xn', 'yn');
title('low-pass filtering using hw');

%% Obtain band-pass from low-pas filter
% Multiply with sequence cos(pi/2 * n) =
% [0, -1, 0, 1, 0, -1, ...]
hwb = hw;
hwb(1:2:end) = 0;
hwb(2:4:end) = -hwb(2:4:end);

%% Obtain frequency-domain of band-pass sequence
HWB = fft(hwb);
figure;
fx = linspace(0,1,L);
plot(fx, abs(HWB));
xlabel('Frequency (x Fs)');
title('FFT of the time-domain band-pass sequence');

%% Filter sinewaves using the band-pass filter
fs = 64000;
N = 64;
x = 0:(N-1);
f1 = 3000;
f2 = 15000;
f3 = 30000;
A = 1;
xn1 = A*sin(2*pi*f1/fs*x);
xn2 = A*sin(2*pi*f2/fs*x);
xn3 = A*sin(2*pi*f3/fs*x);
yn1 = conv(xn1, hwb);
yn2 = conv(xn2, hwb);
yn3 = conv(xn3, hwb);
h = figure;
subplot(2,1,1);
stem(x, xn1, 'r');
hold on;
stem(x, xn2, 'g');
stem(x, xn3, 'b');
xlabel('Sample index');
legend('xn 3kHz', 'xn 15kHz', 'xn 30kHz');
title('Input sinusoids of different frequencies');
subplot(2,1,2);
stem(x, yn1(1:N), 'r');
hold on;
stem(x, yn2(1:N), 'g');
stem(x, yn3(1:N), 'b');
xlabel('Sample index');
legend('yn 3kHz', 'yn 15kHz', 'yn 30kHz');
title('Applying band-pass filtering');

%% Obtain high-pass from low-pas filter
% Multiply with sequence cos(pi * n) =
% [1, -1, 1, -1, ...]
hwh = hw;
hwh(2:2:end) = -hwh(2:2:end);

%% Obtain frequency-domain of high-pass sequence
HWH = fft(hwh);
figure;
fx = linspace(0,1,L);
plot(fx, abs(HWH));
xlabel('Frequency (x Fs)');
title('FFT of the time-domain high-pass sequence');

%% Filter sinewaves using the high-pass filter
fs = 64000;
N = 64;
x = 0:(N-1);
f1 = 3000;
f2 = 15000;
f3 = 30000;
A = 1;
xn1 = A*sin(2*pi*f1/fs*x);
xn2 = A*sin(2*pi*f2/fs*x);
xn3 = A*sin(2*pi*f3/fs*x);
yn1 = conv(xn1, hwh);
yn2 = conv(xn2, hwh);
yn3 = conv(xn3, hwh);
h = figure;
subplot(2,1,1);
stem(x, xn1, 'r');
hold on;
stem(x, xn2, 'g');
stem(x, xn3, 'b');
xlabel('Sample index');
legend('xn 3kHz', 'xn 15kHz', 'xn 30kHz');
title('Input sinusoids of different frequencies');
subplot(2,1,2);
stem(x, yn1(1:N), 'r');
hold on;
stem(x, yn2(1:N), 'g');
stem(x, yn3(1:N), 'b');
xlabel('Sample index');
legend('yn 3kHz', 'yn 15kHz', 'yn 30kHz');
title('Applying high-pass filtering');