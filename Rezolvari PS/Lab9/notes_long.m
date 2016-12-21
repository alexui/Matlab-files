clear;
close all;
gen_signal = 0;
 
%% Generate or load the 2-note signal
if gen_signal
    %% Generate the 2-note signal    
    fs = 1000;
    N = 1024;
    x = 0:(N-1);
    f1 = 392; % (G4 - Sol major)
    A1 = 10;
    f2 = 440; % (A4 - La major)
    A2 = 1;
    s = zeros(1, N);
    s1 = A1*sin(2*pi*f1/fs*x);
    s2 = A2*sin(2*pi*f2/fs*x);
    notes_signal = s1+s2;
    save('notes_signal_long.mat', 'notes_signal', 'fs');
else
    %% Load signal
    fname = 'notes_signal_long.mat';
    load(fname);
end
 
%% Plot signal
N = length(notes_signal);
t = (N/fs)*linspace(0, 1, N);
h = figure;
plot(t, notes_signal);
title('Original signal');
xlabel('Time (s)');
ylabel('Amplitude');
print(h, '-dpng', 'notes_signal.png');
 
%% Plot fft of the signal
ys = fft(notes_signal);
fidx = linspace(0,fs/2-1,N/2);
h = figure;
stem(fidx, abs(ys(1:N/2)));
xlabel('Frequency (Hz)');
title('Frequency spectrum of notes signal');
print(h, '-dpng', 'notes_signal_fftpos.png');
 
%% Try to use a window to limit the sinc's effect
w1 = hanning(N);
w1 = w1(:)';
sw = notes_signal .* w1;
 
%% Plot windowed signal
h = figure;
plot(t, sw);
title('Windowed signal');
xlabel('Time (s)');
ylabel('Amplitude');
print(h, '-dpng', 'notes_signal_window.png');
 
%% Plot fft after window
ys = fft(sw);
fidx = linspace(0,fs/2-1,N/2);
h = figure;
stem(fidx, abs(ys(1:N/2)));
xlabel('Frequency(Hz)');
title('Frequency spectrum of notes signal with window');
print(h, '-dpng', 'notes_signal_window_fftpos.png');