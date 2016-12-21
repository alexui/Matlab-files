function [] = ex1()
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
    cmax = 81;
    kv = -cmax:cmax;
    N = length(kv);
    coef = zeros(N,1);
    for i=1:N
        k = kv(i);
        if mod(k,2) ~= 0
            coef(i) = (2*A) / (j*pi*k);
        end
    end
    
    % Plot coefficients
    h = figure;
    stem(kv, abs(coef));
    xlabel('Frequency component (k)');
    ylabel('Magnitude of component');
    title('Fourier coefficients');
    print(h, '-dpng', 'coefficients.png');
    
    %Delay
    tau = T/4;
    % Compute some of the Fourier coefficients
    cmax = 81;
    kv = -cmax:cmax;
    N = length(kv);
    coefp = zeros(N,1);
    for i=1:N
        k = kv(i);
        if mod(k,2) ~= 0
            coefp(i) = (2*A)*exp((-j*2*pi*k*tau)/T)/(j*pi*k);
        end
    end
    
    % Plot coefficients
    h = figure;
    stem(kv, abs(coefp));
    xlabel('Frequency component (k)');
    ylabel('Magnitude of delayed component');
    title('Fourier coefficients');
    print(h, '-dpng', 'coefficients.png');
    
    %Reconstruct signal
    sr = zeros(1, T);
    for t=1:T
        for i=1:N
            sr(t) = sr(t) + coefp(i)*exp(j*2*pi*kv(i)*t/T);
        end
    end

    h=figure;
    plot(1:T, sr);
    ylim([-A-1, A+1]);
    title('Reconstructed signal s(t)');
    ylabel('Amplitude');
    xlabel('Time');
    print(h, '-dpng', 'reconstructed_signal.png');
end