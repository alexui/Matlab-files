a = 0.05;
T = 128;
x = 1:T;
s = exp(-a*x);
 
h = figure;
plot(x,s);
ylabel('Amplitude');
xlabel('Time');
% ylim([-A-0.5, A+0.5]);
title('Original signal s(t)');
print(h, '-dpng', 'unmodulated_signal.png');
 
%% Plot DFT of initial signal
h = figure;
fx = zeros(1, T);
findex = T/2*linspace(0,1,T/2);
fx((T/2)+1:end) = findex;
fx(1:T/2) = [-T/2, -findex(end:-1:2)];
fs = fft(s);
stem(fx, abs(fftshift(fs)));
xlabel('Frequency component (k)');
ylabel('Magnitude of component');
title('Fourier coefficients before amplitude modulation');
print(h, '-dpng', 'coefficients_before_amod.png');
 
%% Modulate the signal in amplitude
fc = 20/T; %% X times larger than fundamental frequency
ams = zeros(1, T);
for i=1:T
    ams(i) = (1+s(i)) * cos(2*pi*fc*i);
end
 
%% Plot DFT of amplitude modulated signal
h = figure;
fx = zeros(1, T);
findex = T/2*linspace(0,1,T/2);
fx((T/2)+1:end) = findex;
fx(1:T/2) = [-T/2, -findex(end:-1:2)];
fams = fft(ams);
stem(fx, abs(fftshift(fams)));
xlabel('Frequency component (k)');
ylabel('Magnitude of component');
title('Fourier coefficients after amplitude modulation');
print(h, '-dpng', 'coefficients_after_amod.png');