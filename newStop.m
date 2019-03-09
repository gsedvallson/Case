%% Här lägger vi in nya stopp!
clear;
tic;
d=(dec2bin(1:262143));
stop_ny = zeros(262143,18);

for i=1:length(d)
    for j=1:18
        stop_ny(i,j) = str2num(d(i,j));
    end
end


toc;