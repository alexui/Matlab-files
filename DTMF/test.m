clear;
close all;

fs = 8000;
dur = 0.5;
plot_flag = 1;
sound = 1;
sound2 = 0;
dim = 100;


seq = '13';
tone = dtmf_dial(seq, fs, dur, sound);
plot(tone);
y = dtmfdet(tone, fs, plot_flag);
disp(y);

seq2 = '123A456B789C*0#D';
start = round(fs/2);
finish = start + dim;
tones = zeros(length(seq2), dim);
for i = 1 : length(seq2)
    tone2 = dtmf_dial(seq2(i), fs, dur, sound2);
    tones(i,:) = tone2(start+1:finish);
end

figure;
for i = 1 : size(tones,1)
    subplot(4,4,i);
        plot(tones(i,:));
end