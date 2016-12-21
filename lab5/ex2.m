function [] = ex2()

    %s(t) = e^(-aplha*t)*u(t)
    T = 128;
    A = 1;
    u = ones(1, T);
%    u((T/2):T) = A;
    alpha = 0.05;
    
    s = zeros(1,T);
    for t = 1 : T
        s(t) = exp(-alpha*t) * u(t);
    end
    
    %spectrum before
    h = figure;
    plot(1:T,s);
    ylabel('Amplitude');
    xlabel('Time');
    xlim([0,T]);
    title('Original signal s(t)');
    print(h, '-dpng', 'original_signal.png');
    
    h = figure;
    fx = zeros(1, T);
    findex = T/2*linspace(0,1,T/2);
    fx((T/2)+1:end) = findex;
    fx(1:T/2) = [-T/2, -findex(end:-1:2)];
    fs = fft(s);
    stem(fx, abs(fftshift(fs)));
    xlabel('Frequency component (k)');
    ylabel('Magnitude of component');
    title('Fourier coefficients before amplitude modulation');
    print(h, '-dpng', 'coefficients_before_amod.png');
    
    %modulation in amplitude
    fc = 20/T;
    x = zeros(1, T);
    for t = 1:T
       x(t) = (1+s(t))*cos(2*pi*fc*t);
    end
    
    %spectrum after
    h = figure;
    plot(1:T,x);
    ylabel('Amplitude');
    xlabel('Time');
    xlim([0,T]);
    title('x(t)');
    print(h, '-dpng', 'amplitude_modulation.png');
    
    h = figure;
    fx = zeros(1, T);
    findex = T/2*linspace(0,1,T/2);
    fx((T/2)+1:end) = findex;
    fx(1:T/2) = [-T/2, -findex(end:-1:2)];
    fs = fft(x);
    stem(fx, abs(fftshift(fs)));
    xlabel('Frequency component (k)');
    ylabel('Magnitude of component');
    title('Fourier coefficients after amplitude modulation');
    print(h, '-dpng', 'coefficients_after_amod.png');
    
    
end