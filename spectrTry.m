clear, clc, close all
time_array=10^-6;%суммарная длительность сигнала
time_step=10^-10;%дискретизация сигнала
freq_step=1/time_step;
freq=10^9;
signal=[];
%sin_gen(Ampl,freq,Time_array,phase,time_begin,time_end,step)
[signal1,NumberPeriods,time_point,numberPoints1]=sin_gen(10,freq,time_array,0,0.3*10^-6,0.9*10^-6,time_step);
signal=[signal,signal1];

for i=2:1:6
    [new_signal]=sin_gen(10,freq*i,time_array,0,0.2*10^-6,0.5*10^-6,time_step);
    signal=signal+new_signal;
end

figure; plot(time_point,signal);

%[C_Amplitude,F]=spectrFT(signal,freq_step);
%figure; contourf(time_point,F,abs(C_Amplitude));
%A=fft(signal,length(signal));
% A=fftshift(A);
% figure; plot(abs(A));_
 [SSSS,F,T]= spectrogram(signal,rectwin(numberPoints1/30),0,1000,freq);
 figure;contourf(F,T,abs(SSSS'));
 figure;spectrogram(signal,rectwin(1000),0,1000,freq);

