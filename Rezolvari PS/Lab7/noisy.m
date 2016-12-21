close all;
clear;
 
%% Load noisy signal
load('noisy_signal');
N = length(noisy_signal);
t = linspace(0, 1, N);
h = figure;
plot(t, noisy_signal);
xlabel('Time (s)');
title('Signal with noise');
print(h, '-dpng', 'noisy_signal.png');
 
%% Check fft of noisy signal
fss = fft(noisy_signal);
fs = 128;
fidx = 0:127;
h = figure;
stem(fidx, abs(fss));
xlabel('DFT frequency index');
title('Frequency spectrum of noisy signal');
print(h, '-dpng', 'noisy_signal_fft.png');
 
%% Plot only the positive spectrum
h = figure;
stem(fidx(1:N/2-1), abs(fss(1:N/2-1)));
xlabel('DFT frequency index');
title('Frequency spectrum of noisy signal');
print(h, '-dpng', 'noisy_signal_fftpos.png');
 
%% Plot spectrum centred at zero
h = figure;
fidx = linspace(-N/2, N/2-1, N);
stem(fidx, abs(fftshift(fss)));
xlabel('DFT frequency index');
title('zero-centred Frequency spectrum of noisy signal');
print(h, '-dpng', 'noisy_signal_fftcentered.png');
 
%% Compute snr
NS = 10;
psignal = (fss(1:NS)*fss(1:NS)' + fss(end-NS+2:end)*fss(end-NS+2:end)') / (2*NS);
pnoise = fss*fss' / N;
snr = psignal / pnoise
snr_db = 10*log10(snr)
 
%% Filter out frequencies above k=10
ffsf = zeros(1,N);
ffsf(1:11) = fss(1:11);
ffsf(end-9:end) = fss(end-9:end);
figure;
stem(0:127, abs(ffsf));
xlabel('DFT frequency index');
title('Frequency spectrum after removing high freqs');
 
%% Reconstruct signal
sr = ifft(ffsf);
figure;
plot(t, sr);
xlabel('Time (s)');
title('Reconstructed signal after removing high freqs');