function [C_Amplitude,F]=spectrFT(signal,freq_step)

w=0:1000*pi/freq_step:pi;
F=freq_step*w/(2*pi);
C_Amplitude=zeros(length(signal),length(signal));

for m=1:length(signal)
    Cmk=0;
    for k=1:length(signal)
        X=signal(1,k)*exp(-1j*2*pi*m*(k-1)/(length(signal)) );
        Cmk=Cmk+X;
        C_Amplitude(m,k)=Cmk;
    end  
     C_Amplitude(m,k)=Cmk;
end
