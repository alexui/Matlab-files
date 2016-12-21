%ex2
close all;
clear;
fs = 64;

hlow = fir1(fs, 0.2, 'low');
fvtool(hlow);
%plot(hlow);

hband = fir1(fs, [0.2 0.4], 'bandpass');
fvtool(hband);
%plot(hband);

hhigh = fir1(fs, 0.75, 'high');
fvtool(hhigh);
%plot(hhigh);

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
 a = zeros(1,65);
 for i = 1 : 3
    sin = sinus(i,:);
    hlowsin = filter(hlow,1,sin);
    ff = fft(hlowsin);
    stem(abs(ff),color(i));
    hold on;
 end
 
 figure;
 title('hband');
 for i = 1 : 3
    sin = sinus(i,:);
    hbandsin = filter(hband,1,sin);
    ff = fft(hbandsin);
    stem(abs(ff),color(i));
    hold on; 
 end
 
 figure;
 title('hhigh');
 for i = 1 : 3
    sin = sinus(i,:);
    hhighsin = filter(hhigh,1,sin);
    ff = fft(hhighsin);
    stem(abs(ff),color(i));
    hold on; 
 end
