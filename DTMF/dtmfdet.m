function y = dtmfdet(x,fs,pl)
    %  DTMFDET   DTMF - detectarea tonurilor folosind algoritmul Goertzel.
    %  DTMF - Dual-tone multi-frequency
    %  pl - plot flag
    %  
    %  Apel: 
    %  Y = DTMFDET(X,FS) returneaza secventa din semnalul X samplat cu FS.
    %
    %  Y = DTMFDET(X,FS,'strong') uses a more robust algorithm
    %  to detect two equall DTMF signals in a sequence. Some times
    %  not using this strong and longer method can result in
    %  only one DTMF signal detected, instead of the two.
    %

    LIM = .7; % Limita detectarii tonului (daca intensitatea frecventei este mai mica de LIM* max_intensity, tonul nu va fi detectat)
    T = ['1' '2' '3' 'A' '4' '5' '6' 'B' '7' '8' '9' 'C' '*' '0' '#' 'D'];
    FL = [697 770 852 941];
    FH = [1209 1336 1477 1633];

    time = 0.02;
    N = time*fs; % dimenziunea blocului

    ADV = round(N);
    YL = zeros(4,floor(length(x)/ADV));
    YH = YL;

    for i = 1 : 4
        YL(i,:) = goertzel(x,fs,FL(i),N);
        YH(i,:) = goertzel(x,fs,FH(i),N);
    end
    
    YL_copy = YL;
    YH_copy = YH;

    %[a,a] = sort(YL,1);
    %[b,b] = sort(YH,1);

    YL(YL<LIM*max(YL(:))) = 0;
    YH(YH<LIM*max(YH(:))) = 0;  
    
    if pl == 1
        figure;
        for i = 1 : 4
            subplot(4,2,2*(i-1)+1);
            stem(YL_copy(i,:),'LineStyle','-','Color','b','Marker','o');
            ylim([0 100]);
            subplot(4,2,2*(i-1)+2);
            stem(YH_copy(i,:),'LineStyle','-','Color','b','Marker','o');
            ylim([0 100]);
        end
        
        figure;
        for i = 1 : 4
            subplot(4,2,2*(i-1)+1);
            stem(YL_copy(i,:),'LineStyle','-','Color','b','Marker','o');
            ylim([0 100]);
            hold on
            stem(YL(i,:),'LineStyle','-','Color','r','Marker','o');
            ylim([0 100]);
            subplot(4,2,2*(i-1)+2);
            stem(YH_copy(i,:),'LineStyle','-','Color','b','Marker','o');
            ylim([0 100]);
            hold on
            stem(YH(i,:),'LineStyle','-','Color','r','Marker','o');
            ylim([0 100]);
        end
    end

    [l1,l2] = max(YL);
    [h1,h2] = max(YH);

    r = T((l2-1)*4+h2);
    r(l1==0) = '-';
    r(h1==0) = '-';

    ct = 1;
    for i = 2 : length(r)
        if r(i)~='-' & r(i)~=r(i-1)
            y(ct) = r(i);
            ct = ct+1;
        end
    end
end
