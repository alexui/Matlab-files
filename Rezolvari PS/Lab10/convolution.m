
    

    clear;
close all;

%% Generate the sinewave signal    
fs = 64000;
N = 64;
x = 0:(N-1);
f = 3000;
A = 1;
xn = A*sin(2*pi*f/fs*x);
h = figure;
stem(x, xn);
xlabel('Sample index');
title('Input sinusoid sequence');

%% Generate the coefficients h(k)
hk = [0.1, 0.2, 0.2, 0.2, 0.1];
M = length(hk);

%% Convolve h with x
% Note: we must invert the sequence x,
% here done by indexing with -1
L = N-M+1;
y = zeros(1, L);
for i=1:L
    y(i) = hk * xn(i+M-1:-1:i)'; % vector product
end
y2 = conv(xn, hk);
h = figure;
stem(1:L, xn(1:L), 'k');
hold on;
stem(1:L, y, 'b');
stem(1:L, y2(1:L), 'r');
xlabel('Sample index');
legend('x(n)', 'convolution only over non-zero', 'Matlab conv');
title('y(n) = x(n) convolved with h(k)');