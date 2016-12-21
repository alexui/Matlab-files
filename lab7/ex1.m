load('noisy_signal.mat');
h = figure;
N = 128;
freqs = 128;
fx = zeros(1, N);
findex = N/2*linspace(0,1,N/2);
fx((N/2)+1:end) = findex;
fx(1:N/2) = [-N/2, -findex(end:-1:2)];
fs = fft(noisy_signal);
stem(fx, abs(fftshift(fs)));
xlabel('Frequency component (k)');
ylabel('Magnitude of component');
title('Fourier coefficients before amplitude modulation');
print(h, '-dpng', 'coefficients_before_amod.png');
figure;
plot(noisy_signal)
x= [0:1:127];
figure;
stem(x, abs(fs));

figure;
x= [0:1:63];
stem(x, abs(fs(1:64)))

%power = zeros(N,1);

power = fs(1:128)*fs(1:128)' * 1/N
psignal = (fs(1:10)*fs(1:10)' + fs(120:128)*fs(120:128)') * 1/19 

snr = psignal/power

snr_db = 10 * log10(snr)

fs(10:120) = 0;

figure;
x= [0:1:127];
stem(x, abs(fs));

signal_no = ifft(fs);
plot(signal_no);