clear, clc, close all
time_array=10^-5;%суммарная длительность сигнала
time_step=10^-9;%дискретизация сигнала
freq_step=1/time_step;
freq=10^5;
signal=[];

%function [signal, NumberPeriods,time_point, numberPoints]=sin_gen(Ampl,freq,Time_array,phase,time_begin,time_end,step
[signal1,NumberPeriods,time_point,numberPoints1]=sin_gen(10,freq,time_array,0,0.7*10^-5,0.9*10^-5,time_step);
signal=[signal,signal1];

for i=2:8
    [new_signal]=sin_gen(10,freq*i,time_array,0,0.2*10^-5,0.3*10^-5,time_step);
    signal=signal+new_signal;
end

figure(1); plot(time_point,signal);

figure(2); [Sp,F,T]=WindowFourierTrans(signal,i*freq,freq/3,NumberPeriods*10);

%A=fft(signal,length(signal));
% A=fftshift(A);
 %figure(2); plot(abs(A));

% [Sp,F,T]= spectrogram(signal,rectwin(numberPoints1/30*5),0,1000,freq);
 %figure(3);contourf(F,T,abs(Sp'));

 %figure(4);spectrogram(signal,rectwin(1000),0,1000,freq);
 
%function [Sp,T,F]=fourierTrans(signal,max_freq)
%[Sp,T,F]=fourierTrans(signal,freq*5);
%figure(5);contourf(T,F,abs(Sp'));
