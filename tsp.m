%% TSP for stop 1 neighborhood search
clc;
clear;
load 'stop1_comb.mat';
X_cordStop=2;
Y_cordStop=0;
StartCost = zeros(length(stop_comb),1);
TourCost = zeros(length(stop_comb),1);


cords = [2  3  3  1	 0	3	2	3	4	3	1	0	5	4	3	0	1	3;  0   1   -3	-1	-1	-3	-1	-1	-3	-3	-1	-1	-3	-3	-3	-1	-1	1];

le = length(cords);
route = zeros(3,length(cords));
route(1,:) = cords(1,:);
route(2,:) = cords(2,:);
route(3,1) = 1;

for h = 1:length(stop_comb)
    
    route(3,2:end) = stop_comb(h,:);

    for v=1:le
        if(route(3,v)==0)
            cords(1,v)=999;
            cords(2,v)=999;
        end
    end
    
    %Den här tar 120 år och kommer crasha hela campus om den får köra tillräckligt länge
    cords(find(cords==999)) = [];
    
    x = [2  3  3  1	 0	 3	 2	 3	 4	 3	 1	 0	 5	 4	 3	 0	 1	3];
    y = [0  1 -3 -1	-1	-3	-1	-1	-3	-3	-1	-1	-3	-3	-3	-1	-1	1];
    
    counter=0;
    d = 0;
    iMin=0;
    jMin =0;
    steps = length(cords);
    number_of_moves = 50*steps;
    
    %disp("cords före= " + cords);
    
    while (counter<number_of_moves)
        dMin=10000000;
        for k=1:(steps-2)
            for l=(k+3):(steps)
                d = evalMove(k,l,cords);
                if(d<dMin)
                    iMin = k;
                    jMin = l;
                    dMin = d;
                end
            end
        end
        cords = makeMove(iMin,jMin,cords);
        counter = counter+1;
        if dMin >= 0
            break;
        end
        
    end
    
    x2 = cords(1,:);
    y2 = cords(2,:);
    
%     figure(1)
%     plot([x2 x2(1)],[y2 y2(1)],'k+:')
%     
%     figure(2)
%     plot([x x(1)],[y y(1)],'k+:')
    
    D = zeros(length(x),1);
    D2 = zeros(length(x),1);
    for i=1:length(x)-1
        D(i) = sqrt(sum((x(i) - x(i+1)) .^ 2 + (y(i) - y(i+1)) .^ 2));
        D2(i) = sqrt(sum((x2(i) - x2(i+1)) .^ 2 + (y2(i) - y2(i+1)) .^ 2));
    end
    
    StartCost(k) = sum(D);
    TourCost(k) = sum(D2);
% StartCost = sum(D);
% TourCost = sum(D2);
      
    
end
%%
clear;
tic;
d=(dec2bin(1:131071));
stop_ny = zeros(131071,17);

for i=1:length(d)
    for j=1:17
        stop_ny(i,j) = str2num(d(i,j));
    end
end


toc;

%%
clear;
d=(dec2bin(1:131071))


