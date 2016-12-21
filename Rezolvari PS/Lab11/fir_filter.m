
    

    clear;
close all;

%% Generate sinewaves
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

%% Design band-pass filter with fir
L = 64;
wn = [0.2, 0.4];
b = fir1(L, wn);
figure;
fvtool(b,1);

%% Filter sequence with band-pass
yn1 = filter(b, 1, xn1);
yn2 = filter(b, 1, xn2);
yn3 = filter(b, 1, xn3);
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

%% Design high-pass filter with fir
L = 64;
wn = 0.75;
b = fir1(L, wn, 'high');
figure;
fvtool(b,1);

%% Filter sequence with band-pass
yn1 = filter(b, 1, xn1);
yn2 = filter(b, 1, xn2);
yn3 = filter(b, 1, xn3);
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