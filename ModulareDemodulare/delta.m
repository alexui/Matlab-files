function [dif_faza] = delta(a,b)

% calculeaza fft pentru cele 2 semnale
    A=fft(a);
    B=fft(b);
% valoarea maxima si punctul maxim
    [max_a pc_a] = max(abs(A));
    [max_b pc_b] = max(abs(B));
% diferenta de faza in punctele maxime
    dpa = angle(A(pc_a));
    dpb = angle(B(pc_b));

    dif_faza = (180/pi)*(dpb - dpa); % radiani->grade

end
