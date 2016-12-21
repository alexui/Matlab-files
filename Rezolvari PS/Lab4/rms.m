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
 
% Compute some of the Fourier coefficients
cmax = 21;
kv = -cmax:cmax;
N = length(kv);
coef = zeros(N,1);
for i=1:N
    k = kv(i);
    if mod(k,2) ~= 0
        coef(i) = (2*A) / (j*pi*k);
    end
end
 
% Plot power of coefficients
h = figure;
csquare = coef.*coef;
stem(kv,abs(csquare));
xlabel('Frequency component (k)');
ylabel('Magnitude of component');
title('Fourier coefficients squared');
print(h, '-dpng', 'squared_coefficients.png');
 
% Plot rms of error signal
cmax = 1000;
kv = 0:cmax;
N = length(kv);
coef = zeros(N,1);
for i=1:N
    k = kv(i);
    if mod(k,2) ~= 0
        coef(i) = (2*A) / (j*pi*k);
    end
end
 
kmax = 500;
rmse = zeros(kmax, 1);
for i=1:kmax
    ss = coef(i:end)'*coef(i:end);
    rmse(i) = sqrt(2*ss);
end
 
h=figure;
plot(0:(kmax-1), rmse); % Look with plot, semilogy and loglog
title('RMS of e_k');
ylabel('RMS(e_k)');
xlabel('K');
grid on;
print(h, '-dpng', 'rms_ek.png');
 
% Reconstruct signal with only some of the components
% Note: need to use both positive and negative k's
% (mistake in previous solution)
fk = find(rmse < 0.03);
N = fk(1);
sr = zeros(1, T);
for t=1:T
    for i=1:N
        sr(t) = sr(t) + coef(i)*exp(j*2*pi*kv(i)*t/T) ...
                      - coef(i)*exp(-j*2*pi*kv(i)*t/T);
    end
end
 
h=figure;
plot(1:T, sr);
ylim([-A-1, A+1]);
title('Reconstructed signal s(t)');
ylabel('Amplitude');
xlabel('Time');
print(h, '-dpng', 'reconstructed_signal.png');