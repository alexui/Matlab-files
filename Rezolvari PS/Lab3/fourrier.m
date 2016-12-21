close all;
A = 3;
T = 100;
x = 1:T;
s = -A*ones(1, T);
s(1:(T/2)) = A;
 
h = figure;
plot(x,s);
ylabel('Amplitude');
xlabel('Time');
ylim([-A-0.5, A+0.5]);
title('Original signal s(t)');
print(h, '-dpng', 'original_signal.png');
 
cmax = 100;
kv = -cmax:cmax;
N = length(kv);
coef = zeros(N,1);
for i=1:N
    k = kv(i);
    if mod(k,2) ~= 0
        coef(i) = (2*A) / (j*pi*k);
    end
end
 
h = figure;
stem(kv, abs(coef));
xlabel('Frequency component (k)');
ylabel('Magnitude of component');
title('Fourier coefficients');
print(h, '-dpng', 'coefficients.png');

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
title('Fourier coefficients FFT');
print(h, '-dpng', 'coefficients_before_amod.png');

%% Plot DFT of initial signal
sp = zeros(1, length(s));
for t = 1 : length(s)
    sp(t) = s(t) * exp(j*2*pi*10);
end
h = figure;
fx = zeros(1, T);
findex = T/2*linspace(0,1,T/2);
fx((T/2)+1:end) = findex;
fx(1:T/2) = [-T/2, -findex(end:-1:2)];
fsp = fft(sp);
stem(fx, abs(fftshift(fsp)));
hold on;
stem(fx, abs(fftshift(fs)), 'r');
xlabel('Frequency component (k)');
ylabel('Magnitude of component');
title('Fourier coefficients FFT delay');
print(h, '-dpng', 'coefficients_before_amod.png');
 
%% 
sr = zeros(1, T);
for t=1:T
    for i=1:N
        sr(t) = sr(t) + coef(i)*exp(j*2*pi*kv(i)*t/T);
    end
end
 
h=figure;
plot(1:T, sr);
ylim([-A-1, A+1]);
title('Reconstructed signal s(t)');
ylabel('Amplitude');
xlabel('Time');
print(h, '-dpng', 'reconstructed_signal.png');