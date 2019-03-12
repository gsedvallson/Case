%% Generera binär talföljd för kundkombinationer - GÖRS FÖRST

clear;
K = 15;
size = (2^K)-1;
stop_comb = de2bi(1:size);
clear size;

%% TSP for stop 1 neighborhood search
tic
clc;
%load 'stop33_comb.mat';

TourCost = zeros(length(stop_comb),1);


for h = 1:length(stop_comb)

    x = [11	12	16	14	14	17	17	17	14	11	15	14	13	12	12	15];
    y = [12	12	10	15	14	12	13	12	10	13	15	14	12	15	13 14];
    cust = [0 144 147 237 262 361 363 473 476 669 692 748 796 837 1001 1037];
    cords = [x;  y; cust];
   
    le = length(cords);
    
    route = zeros(3,length(cords));
    route(1,:) = x;
    route(2,:) = y;
    route(3,1) = 1;
    route(3,2:length(route)) = stop_comb(h,:);

    v = 1;
    v1 = 1;
    while (v <= size(cords,2))
        if(route(3,v1)==0)
            cords(:,v)=[];
            v = v - 1;
        end
        
        if (v == length(route))
            break;
        end
        v = v + 1;
        v1 = v1 + 1;
    end
    
    counter=0;
    d = 0;
    iMin=0;
    jMin =0;
    steps = size(cords,2);
    number_of_moves = 50*steps;
    
    if(size(cords,2) < 3)
         TourCost(h) = 2 * (sqrt((cords(1,1) - cords(1,2)) .^ 2 + (cords(2,1) - cords(2,2)) .^ 2));
    else
    while (counter<number_of_moves)
        dMin=10000000;
        for k=1:(steps-2)
            for l=(k+2):(steps)
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
    
    D = zeros(length(x2),1);
    if(size(cords,2) > 1)
        for i=1:length(x2)-1
            D(i) = sqrt(sum((x2(i) - x2(i+1)) .^ 2 + (y2(i) - y2(i+1)) .^ 2));
        end
        D(end) = sqrt(sum((x2(end) - x2(1)) .^ 2 + (y2(end) - y2(1)) .^ 2));
    end
   
    TourCost(h) = sum(D);
    end
end


toc


