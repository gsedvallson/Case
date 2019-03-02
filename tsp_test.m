%% TSP for stop 1 neighborhood search

X_cordStop=2;
Y_cordStop=0;

cords = [3	3	1	0	3	2	3	4	3	1	0	5	4	3	0	1	3; 1	-3	-1	-1	-3	-1	-1	-3	-3	-1	-1	-3	-3	-3	-1	-1	1];

x =[3	3	1	0	3	2	3	4	3	1	0	5	4	3	0	1	3];
y =[1	-3	-1	-1	-3	-1	-1	-3	-3	-1	-1	-3	-3	-3	-1	-1	1];


number_of_moves = 1*length(cords);

counter=0;
d=0;
iMin=0;
jMin =0;

while (counter<number_of_moves)
    dMin=10000000; 
    for k=0:1:(length(cords)-3)
        for l=(k+2):1:(length(cords)-1)
            %d =evalMove(k,l,cords);
            if(d<dMin)
                iMin = k;
				jMin = l;
				dMin = d; 
            end
        end
    end
    counter=counter+1;
end

d=sqrt((cords(1,1)-cords(1,2))^2 + (cords(2,1)-cords(2,2))^2);






