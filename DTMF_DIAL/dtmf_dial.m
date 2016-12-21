function tone = dtmf_dial(input, fs, dur, sound)

    %Functia produce un ton corespunzator secventei
    %fs= frecventa de esantionare
    lfg = [697 770 852 941]; % Low frequency group
    hfg = [1209 1336 1477 1633];  % High frequency group
    f  = [];
    for c=1:4,
      for r=1:4,
          f = [ f [lfg(c);hfg(r)] ];
      end
    end
    table=f'
    
    sil_freq=0;
    sil_tt=0:(1/fs):dur;
    sil_tone=sin(2*pi*sil_freq*sil_tt);
    
    tt=0:(1/fs):dur;
  
    tone = [];
    %******************************************************************
    %% Creaza semnal pe baza secventei de intrare : 1 - > (1,1), (1,2) 
    %******************************************************************

    for i = 1 : length(input)
        index = 0;
        tone = [tone sil_tone];
        
        switch  input(i)
            case '1'
                index = 1;
            case '2'
                index = 2;
            case '3'
                index = 3;
            case 'A'
                index = 4;
            case '4'
                index = 5;
            case '5'
                index = 6;
            case '6'
                index = 7;
            case 'B'
                index = 8;
            case '7'
                index = 9;
            case '8'
                index = 10;
            case '9'
                index = 11;
            case 'C'
                index = 12;
            case '*'
                index = 13;
            case '0'
                index = 14;
            case '#'
                index = 15;
            case 'D'
                index = 16;
        end
        
        tone1=sin(2*pi*table(index,1)*tt);  
        tone2=sin(2*pi*table(index,2)*tt);
        tone = [tone tone1+tone2];
    end
    
    if sound == 1
        soundsc(tone,fs);
    end
  end
