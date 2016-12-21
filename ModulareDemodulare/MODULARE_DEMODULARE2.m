%function []= generaresinus()
    clc;
    clear all;
   
    i=1;        %numar biti
    j=0;        %numar combinatii de biti
    y=1;        %b si c capetele intervalului pt salvarea semnalului complet
    n=input('Nr de biti generat:');     % un numar par <=10 ( de la 10 sensibilitatea la zgomot creste considerabil) 
    
    f=1;
    N=100;
    
    SNR=input('Raportul semnal-zgomot(SNR):');     % SNR
    
    if(mod(n,2)==1)     % daca avem nr impar de biti nu se poate realiza modulatia -> iau un nr par de biti
        n=n-1;
    end
   
    gen_biti=randn(n,1);
    biti = zeros(1, n);
    for i=1:n
        if(gen_biti(i)>=0);
            biti(i)= 1;
        else
            biti(i)= 0;
        end 
    end
    
    % afisare sir de biti
    biti   

   %generare semnal in functie de biti/modulare
    for i=1:2:n
        if(biti(i)==0 && biti(i+1)==0)
            t=j:1/N:j+1;
            s=sin(2*pi*f*t);
            cs=cos(2*pi*f*t);
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
            
        t4=0:1/N:j;
        %afisare semnal rezultat fara zgomot
        subplot(2,1,1)
            plot(t4,semn_trans)
        %afisare semnal cu zgomot
        subplot(2,1,2)            
            z=rand(1,length(t4))*(1/SNR);
            semn_zgomot=semn_trans+z; 
            plot(t4,semn_zgomot)
        
        %demodulare
        a(1)=0;
        b(1)=0;
        amplit(1)=0;
        for k=1:length(t4)
            a(k+1)=2/N * (a(k)+semn_trans(k).*semn_cs(k)); 
            b(k+1)=2/N * (b(k)+semn_trans(k).*semn_trans(k));
            amplit(k+1)=amplit(k)+sqrt(a(k)*a(k)+b(k)*b(k));
        end
        for k2=1:length(t4)
            faza(k)=(a(k+1)+i*b(k+1))/(a(k)+i*b(k));
        end  

    
 
      