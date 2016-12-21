function [mag, phase] = goertzel(x,fs,ft,N)
    % GOERTZEL   Goertzel Algorithm.
    %
    %
    %  [MAG,PHASE] = GOERTZEL(X,FS,FT,N) returneaza informatii despre faza si
    %  amplitudine
    %
    %

    if size(x,1)~=1 & size(x,2)~=1
        error('X must be a vector.')
    end

    if size(x,2) == 1
        x = x';
    end

    n = length(x);
    %k = 1*(0.5+N*ft/fs);
    k = N*ft/fs;
    w = 2*pi*k/N;
    c = cos(w);
    s = sin(w);
    coef = 2*c;
    ADV = round(N); % dimensiunea blocului

    re = zeros(1,floor(n/ADV));
    im = re;

    %pentru fiecare bloc
    for j = 1 : floor(n/ADV)
        q1 = 0;
        q2 = 0;
        %parcug blocul
        
        %etapa 1 - IIR filter
        for i = 1 : N
            q0 = coef*q1 - q2 + x(i+(j-1)*ADV);
            q2 = q1;
            q1 = q0;
        end
        %etapa2 - FIR filter
        re(j) = q1 - q2*c;
        im(j) = q2*s;
    end

    % Y(n)
    mag = sqrt(re.^2 + im.^2);
    phase = angle(re+i*im);

end


