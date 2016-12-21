close all;
clear;
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

figure;
plot(x,HK);
hk = ifftshift(ifft(HK));

mid = N/2;
start = mid - 31;
finish = mid + 32;
hktrunc = hk(start:finish);

fs = 64;

black = blackman(fs)';
figure;
hlow = hktrunc .* black;
ff = fft(hlow);
x = (1:fs);
plot(x,abs(ff));
%plot(x,hkblack);

fb = fs/4;
n = (1:fs);
y = cos((2*pi*n*fb)/fs);

hband = hlow .* y;
figure;
stem(n,hband);

ff = fft(hband);
x = (1:fs);
plot(x,abs(ff));

fb = fs/2;
n = (1:fs);
y = cos((2*pi*n*fb)/fs);

hhigh = hlow .* y;
figure;
stem(n,hhigh);

ff = fft(hhigh);
x = (1:fs);
plot(x,abs(ff));

f1 = 3000/fs;
f2 = 15000/fs;
f3 = 30000/fs;

t = linspace(0, 63, 64);
sin1 = sin(2*pi*t*f1);
sin2 = sin(2*pi*t*f2);
sin3 = sin(2*pi*t*f3);

sinus = [sin1; sin2; sin3];
 
 color = ['r' 'g' 'b'];
 figure;
 title('hlow');
 for i = 1 : 3
    sin = sinus(i,:);
    hlowsin = conv(sin,hlow);
    ff = fft(hlowsin);
    stem(abs(ff),color(i));
    hold on;
 end
 
 figure;
 title('hband');
 for i = 1 : 3
    sin = sinus(i,:);
    hbandsin = conv(sin,hband);
    ff = fft(hbandsin);
    stem(abs(ff),color(i));
    hold on; 
 end
 
 figure;
 title('hhigh');
 for i = 1 : 3
    sin = sinus(i,:);
    hhighsin = conv(sin,hhigh);
    ff = fft(hhighsin);
    stem(abs(ff),color(i));
    hold on; 
 end