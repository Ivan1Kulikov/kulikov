function [Sp,T_cell,F_cell]=WindowFourierTrans(signal, max_freq, freq_step, window)

% входные параметры
% signal массив отсчетов сигнала, подлежащего преобразованию 
% max_freq максимальная частота для преобразования 
% freq_step шаг по частоте для преобразования 
% window размер окна преобразования (в отсчетах)


% выходные параметры
% Sp матрица-спектрограмма
% T_cell номера окон преобразования
% F_cell частоты преобразования



signal_length=length(signal);

if (window>signal_length/2)||(freq_step>=max_freq)
    F_cell=[];
    T_cell=[];
    Sp=[];
else
    wasteT=rem(signal_length,window);     %остаток от деления signal_length на window
    signal_length=signal_length-wasteT;
                                                    %отбрасывает то, что не помещается в окна при их неперекрытии
    wasteF=rem(max_freq,freq_step);
    max_freq=max_freq-wasteF;  
                                                        %обеспчение что max_freq=k*freq_step
    F_cell=0:freq_step:max_freq;
    T_cell=1:signal_length/window;
                            %Sp-матрица, столбцы=частоты,
                            %строки=преобразование в окне
    %заполнение выходной матрицы идет рассчитывыя окна на конкретной частоте     
    Sp=zeros(signal_length/window,max_freq/freq_step);
    f_cell=1; %номер столбца по частоте 

    for f=F_cell %движение по столбцам 
    current_time=1; %элемент сигнала
    temp=0; %накопительная переменная для нахождения суммы спектров в окне

        for win_num=1:signal_length/window %движение окна преобразования по времени

            for t=1:window %преобразование фурье в окне
                temp=temp+signal(current_time)*exp(-1j*2*pi*f*current_time); %спектр в момент времени сигнала current_time на частоте f 
                current_time=current_time+1;
            end 
          Sp(win_num,f_cell)=temp; %спектр в окне с номером win_num на частоте f  
          temp=0;
        end
        f_cell=f_cell+1;

    end    

end  
