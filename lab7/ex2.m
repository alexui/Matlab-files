S = load('noisy_sound.mat');
s = S.noisy_sound;

N = 8000;
freqs = S.fs;
fx = zeros(1, N);
findex = N/2*linspace(0,1,N/2);
fx((N/2)+1:end) = findex;
fx(1:N/2) = [-N/2, -findex(end:-1:2)];
fss = fft(s);
%stem(fx, abs(fftshift(fss)));
xlabel('Frequency component (k)');
ylabel('Magnitude of component');
title('Fourier coefficients before amplitude modulation');
print(h, '-dpng', 'coefficients_before_amod.png');
x= [0:1:23999];
figure;
stem(x, abs(fss));

figure
fss(500:24000) = 0;
stem(x(1:499), abs(fss(1:499)));

figure
signal_bass = ifft(fss);
plot(signal_bass);


%sound(s);
figure
plot(s);

%power = zeros(N,1);

length(fs)
power = fs(500:24000)*fs(1:8000)' * 1/8000
psignal = fs(1:500)*fs(1:500)' * 1/500

snr = psignal/power

snr_db = 10 * log10(snr)


