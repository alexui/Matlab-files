    clc;
    clear all;
    i=1;        %numar biti
    j=0;        %numar combinatii de biti
    y=1;        %b si c capetele intervalului pt salvarea semnalului complet
    n=input('Nr de biti generat:');
    f=1;
    N=50;
    SNR=10;
    gen_biti=randn(n,1);
    biti = zeros(1, n);
    for i=1:n
        if(gen_biti(i)>=0);
            biti(i)= 1;
        else
            biti(i)= 0;
        end 
    end
    

   %generare semnal in functie de biti/modulare
    for i=1:2:n
        if(biti(i)==0 && biti(i+1)==0)
            t0=j:1/N:j+1;
            s=sin(2*pi*f*t0);
            cs=cos(2*pi*f*t0);
            x=N*j+1;
            y=N*(j+1)+1;
            semn_trans(x:y)=s;
            semn_cs(x:y)=cs;
            j=j+1;
         end
         if(biti(i)==0 && biti(i+1)==1)
            t1=j:1/N:j+1;
            s=sin(2*pi*f*t1+pi/2);
            cs=cos(2*pi*f*t1+pi/2);
            x=N*j+1;
            y=N*(j+1)+1;
            semn_trans(x:y)=s;
            semn_cs(x:y)=cs;
            j=j+1;
         end
         if(biti(i)==1 && biti(i+1)==1)
            t2=j:1/N:j+1;
            s=sin(2*pi*f*t2+pi);
            cs=cos(2*pi*f*t2+pi);
            x=N*j+1;
            y=N*(j+1)+1;
            semn_trans(x:y)=s;
            semn_cs(x:y)=cs;
            j=j+1;
         end
         if(biti(i)==1 && biti(i+1)==0)
            t3=j:1/N:j+1;
            s=sin(2*pi*f*t3+3*pi/2);
            cs=cos(2*pi*f*t3+3*pi/2);
            x=N*j+1;
            y=N*(j+1)+1;
            semn_trans(x:y)=s;
            semn_cs(x:y)=cs;
            j=j+1;
         end
    end
    
    t=0:1/N:j;
    subplot(2,1,1);
        stem(t,semn_trans);
    subplot(2,1,2)
        z_init=rand(length(t),1)-0.5;
        z_init=z_init';
        intensitate=0.707./(SNR*z_init);
        intensitate=intensitate';
        z= z_init .* (1/SNR);
        %z=z_init.*intensitate;
        semn_zgomot=semn_trans+z; 
        stem(t, semn_zgomot)
        
