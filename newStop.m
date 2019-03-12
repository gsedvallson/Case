%% Här lägger vi in nya stopp!
clear;
clc;
tic;
d=(dec2bin(1:131071));
stop_ny = zeros(32767,17);


for i=1:length(d)
    for j=1:17
        stop_ny(i,j) = str2num(d(i,j));
    end
end

toc;
%%
clear;
K = 19;
size = (2^K)-1;
d=de2bi(1:size);




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
    


