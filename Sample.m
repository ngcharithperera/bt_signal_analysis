[Raw_Data, no_of_elements_in_X] = Raw_Data_Extractor('C:\ResearchCode\BT_SIGNAL_ANALYSIS\1413251016704');

Distace = 100;
segment = Distace / no_of_elements_in_X;
d=0;
Y =  ones(1,no_of_elements_in_X);
%X =  ones(1,no_of_elements_in_X);




for i = 1:no_of_elements_in_X
    d = d + segment;
    Y(1,i) = d;
end

for j = 1:no_of_elements_in_X    
    X(1,j) = Raw_Data{j};
end

 plot(Y, X);
 legend('Raw Data Sariability','Smoothed Signal Variability','location','best');
 ylabel('Signal Strength (RSSI)');
 xlabel('Distance (cm)');
% title(graph_title);
% saveas(h,graph_save_name,'png');