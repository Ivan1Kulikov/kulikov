function [signal, NumberPeriods,time_point, numberPoints]=sin_gen(Ampl,freq,Time_array,phase,time_begin,time_end,step)
%
    NumberPeriods=(time_end-time_begin)*freq;%количество периодов в формируемом сигнале
    signal=[];
    time_point=[];
    numberPoints=0;
    for t=0:step:Time_array

        if (t>=time_begin)&&(t<=time_end)
            time_point=[time_point,t];
            sin_point=Ampl*sin(2*freq*t*3.14+phase);
            signal=[signal,sin_point];
            numberPoints=numberPoints+1;
        else
             time_point=[time_point,t];
             signal=[signal,0];
        end

     end
    

