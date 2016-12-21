
    

    % Simulate a cruise control system
N = 20;
y = zeros(1, N);
f = zeros(1, N);
e = zeros(1, N);
x = 60*ones(1,N);

y(1) = 7; % Initial speed
for i=1:N-1
    e(i) = x(i)-f(i);
    y(i+1) = sys1(y(i), e(i));
    f(i+1) = y(i+1);
end

figure;
plot(1:N, e, 'rx');
hold on;
plot(1:N, y, 'gx');
legend('e', 'y');