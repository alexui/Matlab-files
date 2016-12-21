close all;
A1 = 1;
A2 = 0.5;
fs = 8000;
ts = 1/fs;
f1 = 1000;
f2 = 2000;
N = 8;
n = [0:1:N-1];
s1 = A1 * sin (2*pi*f1*n*ts);
s2 = A2 * sin (2*pi*f2*n*ts);
s = s1+s2;
plot(n, s1, n, s2, n, s);

%ex2
fs = fft(s);
x = [0:1000:7000]; %linspace(0, 8000, 8)
figure;
alexa = abs(fs);
stem(x, abs(fs));
xlabel('DFT freq index');
ylabel('FFT of signal');
title('DFT');

figure

f1 = 0;
s1 = A1 * sin (2*pi*f1*n*ts);
s = s1+s2;

plot(n, s1, n, s2, n, s);

fs = fft(s);
x = [0:1000:7000];
figure;
stem(x, abs(fs));
xlabel('DFT freq index');
ylabel('FFT of signal');
title('DFT');
print(h, '-dpng', 'coefficients_before_amod.png');

%ex3
f2 = 2500;
s2 = A2 * sin (2*pi*f2*n*ts);
s = s1+s2;

fs = fft(s);
x = [0:1000:7000];
figure;
stem(x, abs(fs));
xlabel('DFT freq index');
ylabel('FFT of signal');
title('DFT');
print(h, '-dpng', 'coefficients_before_amod.png');

%ex4 si ex 5
n = [n,zeros(1,56)];
s2 = A2 * sin (2*pi*f2*n*ts);
s = s2;
fs = fft(s);
x = linspace(0, 8000, 64);
figure;
stem(x, abs(fs));
xlabel('DFT freq index');
ylabel('FFT of signal');
title('DFT');
print(h, '-dpng', 'coefficients_before_amod.png');

%ex 6
f2 = 2000;
s2 = A2 * sin (2*pi*f2*n*ts);
s = s2;
fs = fft(s);
x = linspace(0, 8000, 64);
figure;
stem(x, abs(fs));
xlabel('DFT freq index');
ylabel('FFT of signal');
title('DFT');
print(h, '-dpng', 'coefficients_before_amod.png');




