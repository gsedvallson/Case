%% Här lägger vi in nya stopp!
clear;
clc;
tic;
d=(dec2bin(1:32767));
stop_ny = zeros(32767,15);


for i=1:length(d)
    for j=1:15
        stop_ny(i,j) = str2num(d(i,j));
    end
end

toc;

%%
clc;

demand = [1	 1	3	1	2	3	1	3	1	3	1	2	2	2	1]';
temp = zeros(length(stop_ny),1);
summa = zeros(length(stop_ny),1);

for i=1:length(stop_ny)
        temp = demand * stop_ny(i,:);
        summa(i) = sum(temp);
        if (summa(i) > 10)
            stop_ny(i,:) = [];
        end
end
    


