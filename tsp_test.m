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
number_of_moves = 2*steps;

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
    makeMove2(iMin,jMin,cords);
    counter=counter+1;
end

%d=sqrt((cords(1,1)-cords(1,2))^2 + (cords(2,1)-cords(2,2))^2);


%%
clear;
A=1:1:5;

for i=5:-1:1
    A(i)
end


