%ex3
close all;
clear;

fs = 64;
[blow,alow] = butter(fs, 0.2, 'low');
[bband,aband] = butter(fs, [0.2 0.4], 'bandpass');
[bhigh,ahigh] = butter(fs, 0.2, 'high');

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
    hlowsin = filter(blow,alow,sin);
    ff = fft(hlowsin);
    stem(hlowsin,color(i));
    hold on;
 end
 
 figure;
 title('hband');
 for i = 1 : 3
    sin = sinus(i,:);
    hbandsin = filter(bband,aband,sin);
    ff = fft(hbandsin);
    stem(hbandsin,color(i));
    hold on; 
 end
 
 figure;
 title('hhigh');
 for i = 1 : 3
    sin = sinus(i,:);
    hhighsin = filter(bhigh,ahigh,sin);
    ff = fft(hhighsin);
    stem(hhighsin,color(i));
    hold on; 
 end