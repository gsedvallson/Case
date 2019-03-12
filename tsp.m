%% TSP for stop 1 neighborhood search
tic
clc;
clear;
load 'stop1_comb.mat';
% X_cordStop=2;
% Y_cordStop=0;


    %x = [2  3  3  1	 0	 3	 2	 3	 4	 3	 1	 0	 5	 4	 3	 0	 1	3];
    %y = [0  1 -3 -1	-1	-3	-1	-1	-3	-3	-1	-1	-3	-3	-3	-1	-1	1];
%     x = [-125 -124 -123 -124 -128 -128 -129 -125 -122 -121 -122 -126];
%     y = [130 130 135 137 134 135 136 140 138 134 118 128];
%     cust = [0 956 995 460 680 647 509 1225 483 772 574 214]; 
 x = [-125 -126 -124 -122 -129 -122 -128 -128 -121 -124 -124 -123 -121 -121 -122	-125];
    y = [130 128 137 138 136 118 135 134 134 121 130 135 126 134 124 140];
    cust = [0 214 460 483 509 574 647 680 772 930 956 995 1124 1139 1178 1225];
    
    cords = [x;  y; cust];
   
    le = length(cords);
    counter = 0;
    d = 0;
    iMin = 0;
    jMin = 0;
    steps = length(cords);
    number_of_moves = 50*steps;
    
    
    while (counter<number_of_moves)
        dMin=10000000;
        for k=1:(steps-2)
            for l=(k+2):(steps)
                d = evalMove(k,l,cords);
                    if(counter==140)
                        disp("d: " + d + " mellan " + k + " och " + l);
                    end 
                if(d<dMin)
                    iMin = k;
                    jMin = l;
                    dMin = d;
                end
            end
        end
              if(counter==0)
        disp("dMin: " + dMin);
              end
        cords = makeMove(iMin,jMin,cords);
        counter = counter+1;
        if dMin >= 0
            break;
        end
        
    end
    
    x2 = cords(1,:);
    y2 = cords(2,:);
    
        figure(1)
        plot([x2 x2(1)],[y2 y2(1)],'k+:')
    
        figure(2)
        plot([x x(1)],[y y(1)],'k+:')
    
    D = zeros(length(x),1);
    D2 = zeros(length(x2),1);
    if(size(cords,2) > 1)
        for i=1:length(x2)-1
            D(i) = sqrt(sum((x(i) - x(i+1)) .^ 2 + (y(i) - y(i+1)) .^ 2));
            D2(i) = sqrt(sum((x2(i) - x2(i+1)) .^ 2 + (y2(i) - y2(i+1)) .^ 2));
        end
        D(end) = sqrt(sum((x(end) - x(1)) .^ 2 + (y(end) - y(1)) .^ 2));
        D2(end) = sqrt(sum((x2(end) - x2(1)) .^ 2 + (y2(end) - y2(1)) .^ 2));
    end
    
%         
%         if (h == 10)
%             disp("route: " + route);
%             disp("cords " + cords);
%             disp("D: " + D);
%             disp("distD: " + sum(D));
%         end
    


    %TourCost(h) = sum(D);
    StartCost = sum(D);
    TourCost = sum(D2);
    
%end
toc