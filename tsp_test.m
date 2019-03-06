%% TSP for stop 1 neighborhood search
clc;
clear;
X_cordStop=2;
Y_cordStop=0;

cords = [2 3	3	1	0	3	2	3	4	3	1	0	5	4	3	0	1	3  0   1	-3	-1	-1	-3	-1	-1	-3	-3	-1	-1	-3	-3	-3	-1	-1	1];

x =[2 3	3	1	0	3	2	3	4	3	1	0	5	4	3	0	1	3];
y =[0 1	-3	-1	-1	-3	-1	-1	-3	-3	-1	-1	-3	-3	-3	-1	-1	1];

counter=0;
d=0;
iMin=0;
jMin =0;
steps = length(cords)/2;
number_of_moves = 50*steps;

disp("cords före= " + cords);

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
    cords2 = makeMove2(iMin,jMin,cords);
    counter=counter+1;
    if dMin >= 0
       break; 
    end
    
end
x2= cords2(1:steps);
y2 =cords2(steps+1:end);

D = zeros(length(x),1);
D2 = zeros(length(x),1);
for i=1:length(x)-1
D(i) = sqrt(sum((x(i) - x(i+1)) .^ 2 + (y(i) - y(i+1)) .^ 2));
D2(i) = sqrt(sum((x2(i) - x2(i+1)) .^ 2 + (y2(i) - y2(i+1)) .^ 2)); 
end

StartCost = sum(D);
TourCost = sum(D2);

%d=sqrt((cords(1,1)-cords(1,2))^2 + (cords(2,1)-cords(2,2))^2);


%% 
clear;












