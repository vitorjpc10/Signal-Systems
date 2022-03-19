close all;
clear all;

%Load File, ensure file is in same directory
%x variable will contain the data
%Fs variable is the Sampling Frequency
file = 'Signal3.wav'; %demo-signal.wav , Signal3.wav , Audio.wav
[x,Fs] = audioread(file);       %read the file

Ts = 1/Fs;                      %Ts is Sampling Period
Nsamps = length(x);             %Nsamps is the length of array x
t = Ts*(1:Nsamps);              %Prepare time data for plot
                                %Array is the length of Nsamps in
                                %increments of Ts

%Do Fourier Transform
x_fft = abs(fft(x)/Fs);         %Normalize the signal & Retain Magnitude
x_fft = x_fft(1:Nsamps/2);      %Discard Half of Points
f = Fs*(0:Nsamps/2-1)/Nsamps;   %Prepare freq data for plot

%Plot Sound File in Time Domain
figure;
plot(t, x);
xlim([1.0 1.008]);    %For part2 is xlim([0.063 0.07]);          %only plot t within xlim
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Signal in Time Domain'); %Original Signal in Time Domain of Part 3

%Plot Sound File in Frequency Domain
figure;
plot(f, x_fft);
xlim([0 2100]);      %For part 2 is xlim([0 2100]);            %only plot f = 0 to 1000 Hz
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Frequency Spectrum of Original Signal');

%Cosine
% x1 = 2* cos(10 * t);
% figure
% plot(t, x1);
% xlim([0 2]);                    %only plot xlim                
% xlabel('Time (s)');
% ylabel('Amplitude');
% title('Cosine');
 
% PART 1 ------------------------------------------------------------------

%X1 Cosine
x1 = 2 * 0.039169 * cos((2 * pi * 385) * t);
figure
plot(t, x1);
xlim([0.8 0.81]);                    %only plot xlim                
xlabel('Time (s)');
ylabel('Amplitude');
title('X1 Cosine');

%X2 cosine (will be the same as x1 for a2 is 0 for all even k's)
x2 = 2 *  0.039169 * cos((2 * pi * 385) * t) + 2 *  0.03152 * cos((2 * pi * 783) * t);
figure
plot(t, x2);
xlim([0.8 0.81]);                    %only plot xlim                
xlabel('Time (s)');
ylabel('Amplitude');
title('X2 Cosine');


%X3 cosine
x3 = 2 *  0.039169 * cos((2 * pi * 385) * t) + 2 *  0.03152 * cos((2 * pi * 783) * t) + 2 *  0.031351 * cos((2 * pi * 1180) * t);
figure
plot(t, x3);
xlim([0.8 0.81]);                    %only plot xlim                
xlabel('Time (s)');
ylabel('Amplitude');
title('X3 Cosine');


%X4 cosine
x4 = 2 *  0.039169 * cos((2 * pi * 385) * t) + 2 *  0.03152 * cos((2 * pi * 783) * t) + 2 *  0.031351 * cos((2 * pi * 1180) * t) + 2 *  0.026909 * cos((2 * pi * 1567) * t);
figure
plot(t, x4);
xlim([0.8 0.81]);                    %only plot xlim                
xlabel('Time (s)');
ylabel('Amplitude');
title('X4 Cosine');


%X5 cosine
x5 = 2 *  0.039169 * cos((2 * pi * 385) * t) + 2 *  0.03152 * cos((2 * pi * 783) * t) + 2 *  0.031351 * cos((2 * pi * 1180) * t) + 2 *  0.026909 * cos((2 * pi * 1567) * t) + 2 *  0.013683 * cos((2 * pi * 1948) * t);
figure
plot(t, x5);
xlim([0.8 0.81]);                    %only plot xlim                
xlabel('Time (s)');
ylabel('Amplitude');
title('X5 Cosine');

%Fourier Transform of X5
x5_fft = abs(fft(x5)/Fs);         %Normalize the signal & Retain Magnitude
x5_fft = x5_fft(1:Nsamps/2);      %Discard Half of Points
f = Fs*(0:Nsamps/2-1)/Nsamps;   %Prepare freq data for plot

figure;
plot(f, x5_fft);
xlim([0 2100]);                 %only plot f = 0 to 1000 Hz
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Fourier Transform of X5');


%PART 2 - Exponential function (RC Low-Pass Filter of 200hz)---------------
%Using Signal3.wav

%Unit Inpulse Response
h1 = (1/(53.03 * 15 * 10 ^-6)) * exp((-1/(53.03 * 15 * 10 ^-6)) * t);
figure
plot(t,h1);
xlim([0 0.01]);                    %only plot t withing xlim
xlabel('Time (s)');
ylabel('Amplitude');
title('Unit Impulse Response for Instrument Signal LowPass Filter (H1)');

%Fourier Transform
h1_fft = abs(fft(h1)/Fs);         %Normalize the signal & Retain Magnitude
h1_fft = h1_fft(1:Nsamps/2);      %Discard Half of Points
f = Fs*(0:Nsamps/2-1)/Nsamps;   %Prepare freq data for plot

figure;
plot(f, h1_fft);
xlim([0 2100]);                 %only plot f = 0 to 1000 Hz
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Fourier Transform of the Low-Pass Filter of H1');

%Convolution of Original Signal and Filter
y1 = conv(x,h1)*Ts;              %multiply by interval Ts to get integral
Nsamps = length(y1);             %Nsamps is the length of array y
t = (Ts)*(1:Nsamps);            %Prepare time data for plot
figure
plot(t,y1);
xlim([0 2]);                    %only plot t within xlim
xlabel('Time (s)');
ylabel('Amplitude');
title('Convolution of Original Signal and H1');


%Plot Y1 in Time Domain
figure;
plot(t, y1);
xlim([1.0 1.008]);              %only plot t within xlim
xlabel('Time (s)');
ylabel('Amplitude');
title('Filtered Signal in Time Domain of Part 2');

%Fourier Transform of Y1 (Filtered Signal)
y1_fft = abs(fft(y1)/Fs);         %Normalize the signal & Retain Magnitude
y1_fft = y1_fft(1:Nsamps/2);      %Discard Half of Points
f = Fs*(0:Nsamps/2-1)/Nsamps;   %Prepare freq data for plot

figure;
plot(f, y1_fft);
xlim([0 2100]);                 %only plot f = 0 to 1000 Hz
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Fourier Transform of Filtered Signal Y1');

fileFiltered1 = 'Signal3Filtered.wav'; 
audiowrite(fileFiltered1,y1, Fs);

%PART 3 - Exponential function (RC Low-Pass Filter of 100hz)---------------
%Using Audio.wav

%Unit Inpulse Response of H2
h2 = (1/(106.1 * 15 * 10 ^-6)) * exp((-1/(106.1 * 15 * 10 ^-6)) * t);
figure
plot(t,h2);
xlim([0 0.01]);                    %only plot t withing xlim
xlabel('Time (s)');
ylabel('Amplitude');
title('Unit Impulse Response for Music Signal LowPass Filter (H2)');

%Fourier Transform of H2
y1_fft = abs(fft(h2)/Fs);         %Normalize the signal & Retain Magnitude
y1_fft = y1_fft(1:Nsamps/2);      %Discard Half of Points
f = Fs*(0:Nsamps/2-1)/Nsamps;   %Prepare freq data for plot

figure;
plot(f, y1_fft);
xlim([0 3000]);                 %only plot f = 0 to 1000 Hz
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Fourier Transform of the Low-Pass Filter of H1');

%Convolution of Original Signal and Filter
y2 = conv(x,h2)*Ts;              %multiply by interval Ts to get integral
Nsamps = length(y2);             %Nsamps is the length of array y
t = (Ts)*(1:Nsamps);            %Prepare time data for plot
figure
plot(t,y2);
xlim([0 2]);                    %only plot t within xlim
xlabel('Time (s)');
ylabel('Amplitude');
title('Convolution of Original Signal and H2');

%Plot Y2 in Time Domain (Filtered Signal)
figure;
plot(t, y2);
xlim([0.55 0.60]);              %only plot t within xlim
xlabel('Time (s)');
ylabel('Amplitude');
title('Filtered Signal in Time Domain of Part 3');

%Fourier Transform of Y2 (Filtered Signal)
y2_fft = abs(fft(y2)/Fs);         %Normalize the signal & Retain Magnitude
y2_fft = y2_fft(1:Nsamps/2);      %Discard Half of Points
f = Fs*(0:Nsamps/2-1)/Nsamps;   %Prepare freq data for plot

figure;
plot(f, y2_fft);
xlim([0 3000]);                 %only plot f = 0 to 1000 Hz
xlabel('Frequency (Hz)');
ylabel('Amplitude');
title('Fourier Transform of Filtered Signal Y2');

%demo-signal.wav , Signal3.wav , Audio.wav
fileFiltered2 = 'AudioFiltered.wav'; 
audiowrite(fileFiltered2,y2, Fs);