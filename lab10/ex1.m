close all;
x = [1, 3, 5, 7, 5];
h = [0.1, 0.3, 0.1];

xp = x;
x = fliplr(x);
n = length(x);
m = length(h);
y = zeros(1, m);
for i = 1 : n-m+1
    y(i) = h*x(i:i+m-1)';
end

y

%ex3
f = 3000;
t = linspace(0,0.001, 64);
h = [0.1, 0.2, 0.2, 0.2, 0.1];
x = sin(2*pi*t*f);

n = length(x);
m = length(h);
y = zeros(1, n);
for i = 1 : n-m+1
    y(i) = h*x(i:i+m-1)';
end

z = conv(h,x);

figure;
stem(x,'r');
hold on;
stem(y,'g');
hold on;
stem(z,'b');

%ex4
x = [0, 0, 0, 0, 1, 0, 0, 0, 0];
h = [0.1, 0.2, 0.2, 0.2, 0.1];

n = length(x);
m = length(h);
y = zeros(1, n);
for i = 1 : n-m+1
    y(i) = h*x(i:i+m-1)';
end

z = conv(h,x);

figure;
stem(x,'r');
hold on;
stem(y,'g');
hold on;
stem(z,'b');
%obs : conv are N+M-1 elemente
