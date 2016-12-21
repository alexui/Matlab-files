    clc;                                                
    clear all;                                          
                                                    
    j=0;        
    y=1;        
    n=input('Nr de biti generat:');                % un numar par <=10 ( de la 10 sensibilitatea la zgomot creste considerabil) 
    
    f=1;                                         % frecventa purtatoarei - am ales 110000 dar simulez cu variabila 110 pentru a se observa mai bine rezultatele
    N=1000;                                        % nr esantioane 
    SNR=input('Raportul semnal-zgomot(SNR):');     % SNR
    
    if(mod(n,2)==1)                                % daca avem nr impar de biti nu se poate realiza modulatia -> iau un nr par de biti
        n=n-1;
    end
    %generare sir de biti aleator
    gen_biti=randn(n,1);
    for i=1:n
        if(gen_biti(i)>=0);
         biti1(i)=1;
        else biti1(i)=0;
        end 
    end  
    % afisare sir de biti
    biti1                                          
    %concatenare sir de biti cu '00' la inceput
    %pentru a crea faza initiala 0
    biti=horzcat(0,0,biti1);                      
   %generare semnal in functie de biti <=> modulare in faza
    for i=1:2:n+2
        if(biti(i)==0 && biti(i+1)==0)
            t=j:1/N:j+1;
            s=sind(2*180*f*t);
            x=N*j+1;
            y=N*(j+1)+1;
            semn_trans(x:y)=s;
            
        end
         if(biti(i)==0 && biti(i+1)==1)
            t1=j:1/N:j+1;
            s=sind(2*180*f*t1+90);
            x=N*j+1;
            y=N*(j+1)+1;
            semn_trans(x:y)=s;
            
         end
         if(biti(i)==1 && biti(i+1)==1)
            t2=j:1/N:j+1;
            s=sind(2*180*f*t2+180);
            x=N*j+1;
            y=N*(j+1)+1;
            semn_trans(x:y)=s;
            
         end
         if(biti(i)==1 && biti(i+1)==0)
            t3=j:1/N:j+1;
            s=sind(2*180*f*t3+270);
            x=N*j+1;
            y=N*(j+1)+1;
            semn_trans(x:y)=s;
         end
            
        j=j+1;   
    end        
   
       %afisare semnal rezultat fara zgomot
        t4=0:1/N:j;
            subplot(2,1,1)
                plot(t4,semn_trans)
       %afisare semnal cu zgomot
            subplot(2,1,2)
                z=rand(1,length(t4))*(1/SNR);
                semn_zgomot=semn_trans+z; 
                plot(t4,semn_zgomot)
    
 rez_biti=[];              
 %semnalul de referinta pentru care se face delta_faza
 ref = semn_zgomot(1:N);
 
 for i=2 : int32((n+2)/2)
    semnal_curent = semn_zgomot((i-1)*N + 1:i*N);    % partea de semnal pe care doresc sa o demodulez 
    delta_faza = (delta(ref,semnal_curent));         % calcularea diferentei de faza
    %delta_faza = phdiffmeasure(ref,semnal_curent);  %se poate calcula delta_faza in 2 %moduri
 delta_faza;
   %ajustare 
   while(delta_faza >=360)
       delta_faza =delta_faza-360;
   end
  while(delta_faza<0)
      delta_faza=360+delta_faza;
  end
 

 if(i==2)
     delta_faza=delta_faza-90;                      % prima parte de semnal este defazata cu 90 grade
     
 end
 if(i>=6)
     delta_faza=delta_faza+90;                      % de la partea a5a de semnal, apare din nou un defazaj de 90 grade
 end
    %ajustare
    while (delta_faza >=360)
       delta_faza =delta_faza-360;
   end
  while (delta_faza<0)
      delta_faza=360+delta_faza;
  end
        % demodulare
        if ((delta_faza < 45) && (delta_faza >=0) || ( delta_faza>=315 && delta_faza<0))
            rez_biti=horzcat(rez_biti,0,1);
        end
        if (delta_faza>=45) && (delta_faza<135)
            rez_biti=horzcat(rez_biti,1,1);
        end
        if (delta_faza>=135) && (delta_faza<225)
            rez_biti=horzcat(rez_biti,1,0);
        end
        if (delta_faza>=225) && (delta_faza<315)
            rez_biti=horzcat(rez_biti,0,0);
 
        end
 end
 
 %afisare sir de biti demodulat
 rez_biti
 %verificare corectitudine
 
if(biti1==rez_biti)
     disp('Bun');
 else
     disp('Nu e bun');
 end

