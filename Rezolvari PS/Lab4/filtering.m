close all;
A = 1;
D = 20;
T = 100;
x = 1:T;
s = zeros(1,T);
s(1:D) = A;
 
h = figure;
plot(x,s);
ylabel('Amplitude');
xlabel('Time');
ylim([-A-0.5, A+0.5]);
title('Original signal s(t)');
print(h, '-dpng', 'pulse_signal.png');
 
% Compute some of the Fourier coefficients
cmax = 20;
kv = 0:cmax;
N = length(kv);
coef = zeros(N,1);
for i=1:N
    k = kv(i);
    coef(i) = (D/T)*A*exp(-j*pi*k*D/T)*sinc(k*D/T);
end
 
% Plot magnitude of pulse's coefficients
h = figure;
stem(kv, abs(coef));
xlabel('Frequency component (k)');
ylabel('Magnitude of component');
title('Input Fourier coefficients');
hold on;
plot(kv, abs(coef), 'r--');
print(h, '-dpng', 'coef_pulse.png');
 
% Compute coefficients of output after lp filter
fcoef = zeros(N,1);
fc = 10/T;
RC = 1/(2*pi*fc);
for i=1:N
    k = kv(i);
    fcoef(i) = coef(i) / (1+j*2*pi*RC*k/T);
end
 
% Plot magnitude of output's coefficients
h = figure;
stem(kv, abs(fcoef));
xlabel('Frequency component (k)');
ylabel('Magnitude of component');
title('Output Fourier coefficients');
hold on;
plot(kv, abs(fcoef), 'r--');
print(h, '-dpng', 'coef_out.png');
 
%Construct output signal with the computed coefficients
sr = zeros(1, T);
for t=1:T
    for i=1:N
        if kv(i) ~= 0
            sr(t) = sr(t) + fcoef(i)*exp(j*2*pi*kv(i)*t/T) ...
                    + conj(fcoef(i))*exp(-j*2*pi*kv(i)*t/T);
        else
            sr(t) = sr(t) + fcoef(i)*exp(j*2*pi*kv(i)*t/T);
        end
    end
end
 
h=figure;
plot(1:T, sr);
ylim([-A, A]);
title('Output filtered signal s(t)');
ylabel('Amplitude');
xlabel('Time');
print(h, '-dpng', 'output_signal.png');