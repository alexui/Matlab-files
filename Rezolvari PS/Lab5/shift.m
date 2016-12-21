A = 1;
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
 
%% Compute some of the Fourier coefficients
% These will be used also for reconstruction
cmax = 81;
kv = -cmax:cmax;
N = length(kv);
coef = zeros(N,1);
for i=1:N
    k = kv(i);
    if mod(k,2) ~= 0
        coef(i) = (2*A) / (j*pi*k);
    end
end
 
%% Plot  coefficients
h = figure;
stem(kv, abs(coef));
xlabel('Frequency component (k)');
ylabel('Magnitude of component');
title('Fourier coefficients before phase shift');
print(h, '-dpng', 'coefficients_before_pshift.png');

%% Shift spectrum in frequency
tshift = T/4;
scoef = zeros(N, 1);
for i=1:N
    scoef(i) = coef(i) * exp(-j*2*pi*kv(i)*tshift/T);
end    
 
%% Plot  coefficients
h = figure;
stem(kv, abs(scoef));
xlabel('Frequency component (k)');
ylabel('Magnitude of component');
title('Fourier coefficients after phase shift');
print(h, '-dpng', 'coefficients_after_pshift.png');

%% Reconstruct signal after phase shift
sr = zeros(1, T);
for t=1:T
    for i=1:N
        sr(t) = sr(t) + scoef(i)*exp(j*2*pi*kv(i)*t/T);
    end
end
 
h=figure;
plot(1:T, sr);
ylim([-A-0.5, A+0.5]);
title('Reconstructed signal s(t) after phase shift');
ylabel('Amplitude');
xlabel('Time');
print(h, '-dpng', 'reconstructed_signal_after_pshift.png');