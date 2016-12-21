
    

    t = 0:0.1:2*pi;
figure;
plot(exp(1i*t), 'k.');
hold on;
plot(0, 0, 'kx');
t = [0, pi/6, pi/4, pi/3, pi/2];
plot(exp(1i*t), 'ro');
plot(exp(-1i*t), 'bo');
ss = (exp(1i*t)+exp(-1i*t))/2;
plot(real(ss), imag(ss), 'go');
legend('circle', 'origin', 'e^jt', 'e^-jt', '(e^jt + e-jt)/2');