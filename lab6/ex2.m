
    freq = 8000;
    T = 100;
    t = linspace(0,100/freq,T);
    s = sin(2*pi*3000*t);
    figure
    plot (t,s);

    N=64;
    K = freq/64;
    h = figure;
    fx = zeros(1, N);
    findex = N/2*linspace(0,freq/64,N/2);
    fx((N/2)+1:end) = findex;
    fx(1:N/2) = [-N/2, -findex(end:-1:2)];
    fs = fft(s,64);
    stem(fx, abs(fftshift(fs)));
    xlabel('Frequency component (k)');
    ylabel('Magnitude of component');
    title('Fourier coefficients before amplitude modulation');
    print(h, '-dpng', 'coefficients_before_amod.png');
