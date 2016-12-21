close all;
%ex1
fs = 256;
N = 256;
HK = zeros(1,N);
x = linspace(0,1,N);
for i = 1 : N
    if (i < fs/16)
        HK(i) = 1;
    end
    if (i > N - fs/16)
        HK(i) = 1;
    end
end

%ex2
figure;
plot(x,HK);
hk = ifftshift(ifft(HK));
length(hk)
figure;
stem(x,abs(hk));

%ex3
mid = N/2;
start = mid - 32;
finish = mid + 32;
hktrunc = hk(start:finish);

%ex4
ff = fft(hktrunc);
figure;
x = linspace(0,1,65);
plot(x,abs(ff));

%ex5
black = blackman(65)';
figure;
hkblack = hktrunc .* black;
ff = fft(hkblack);
x = linspace(0,1,65);
plot(x,abs(ff));
title('smecher');

%ex6
f = 3000;
t = linspace(0,0.001, 64);
x = sin(2*pi*t*f);
hkblacksin = conv(hkblack, x);

figure;
stem(x,'b');
hold on;
stem(hkblacksin, 'r');