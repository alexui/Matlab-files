function [] = ex5(N)
    ve = zeros(1,N);
    t = [1:N];
    x = 60 + zeros(1,N);
    y = zeros(1,N);
    y(1) = 7;
    for i=1:N-1
      e = x(i) - y(i);
      ve(i) = e;
      y(i+1) = s1(y(i), e);
    end
    plot(t,y,t,ve);
    xlabel('t');
    ylabel('viteza');
    legend('v','e');
end