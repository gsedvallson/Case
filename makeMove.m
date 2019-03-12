function cords = makeMove(iMin,jMin,A) 
%Används för byte med givna koordinater

i = iMin;
j = jMin;
n = 1000;

for k=1:n
    if(j==(i+1) || i == j)
        break;
    end
    tempX = A(1,i+1);
    A(1,i+1) = A(1,j);
    A(1,j) = tempX;
    tempY = A(2,i+1);
    A(2,i+1) = A(2,j);
    A(2,j) = tempY;
    tempCust = A(3,i+1);
    A(3,i+1) = A(3,j);
    A(3,j) = tempCust;
    i = i + 1;
    j = j - 1;
    
end

cords = A;
end