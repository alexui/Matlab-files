function [ ] = ex1(A1, A2, f1, f2)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%1 . interval : [1/1800; 1/1600]
%1. se ia multiplu comun 1/200
    
    pas = (1/200)/100;
    t = [0:pas:1/200];
    y1 = A1 * sin(2*pi*f1*t);
    y2 = A2 * sin(2*pi*f2*t);
    
    plot(t, y1, 'g');
    hold on
    plot(t, y2,'r');
    title('Transmision')
    xlabel('t')
    ylabel('Amplitude')
    legend('y1','y2')

end

