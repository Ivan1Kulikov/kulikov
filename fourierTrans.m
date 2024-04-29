function [Sp,T,F]=fourierTrans(signal,max_freq)
Sp=signal;
T=1:length(signal);
F=0:10^6:max_freq;
Sp=zeros(length(T),length(F));%Т строк F столбцов (при движении по строке меняется частота)
temp=0;
stepF=1; %нужен для формирования таблицы по порядковм номерам

for f=F
    Sp(1,stepF)=signal(1)*exp(-1j*2*pi*f*1);
    stepF=stepF+1; 
end
%
% for t=1:length(signal) %движение по строкам (по времени)
%     stepF=1;
% 
%     for f=0:10^7:max_freq %движение по столбцам (по частотам на конкретном времени)
%         tempSignal=signal(t)*exp(-1j*f*2*pi*t);%спектр в момент t на частоте w
% 
%         for sumT=1:t 
%            tempSp=Sp(sumT,stepF);
%            Sum= 
%         end
%          stepF=stepF+1;
%          Sp(t,stepF)=tempSignal;
% end
stepF=1;
for f=F %движение по столбцам (по частотам на конкретном времени)
    
    for t=2:length(signal)
        tempSignal=signal(t)*exp(-1j*2*pi*f*t*10^-10);
        Sp(t,stepF)=tempSignal;
    end

    stepF=stepF+1;
end

end

