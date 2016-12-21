function [] = ex2(N,T)
    
    u = zeros(1,N);
    for t=1:N
        u(t) = 1;
    end
    
     x=1:N; 
     r = ramp(N)
     rt = [zeros(1,T), r(1:N-T)];
     ut = [zeros(1,T), u(1:N-T)];
     s = r - rt - T*ut;
     
     figure
%     plot(x, -ut)
     plot(x,r,'go', x,-rt,x,-T*ut,'r-')
     hold on
     plot(x,s,'LineWidth', 4,'Color',[1 0 1])
     xlabel('x')
     ylabel('s')
     legend('ramp','-ramp delayed', '-trap delayed', 'signal')
end
 
 