close all;
 
f= [1, 2, 10, 20, 50, 100];
wvec = [0.2, 0.2, 0.2, 0.2, 0.2];
np = length(wvec);
 
 
fm = 10;
tm = 1/fm;
t = linspace(0, 1, 128);
for i=1:length(f)
    s=sin(2*pi*f(i)*t);
    s1 = zeros(1,128);
    for j=np:128
        idx1 = j-np+1;
        idx2 = j;
        s1(j) = s(idx1:idx2) * wvec';        
    end
    h = figure;
    plot(t,s, 'b-');
    hold on;
    plot(t, s1, 'r--');
    ylim([-1, 1]);
    legend('Original signal', 'Signal after processing');
    title(['Moving average for frequency ', num2str(f(i))]);
    print(h, '-dpng', ['mavg_freq_', num2str(f(i)), '.png']);
end