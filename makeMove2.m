function cords = makeMove2(iMin,jMin,A)

le = length(A)/2;
i = iMin;
j = jMin;
n = 1000;
disp("i= " + iMin);
disp("j= " + jMin);

for k=1:n
    if(j==(i+1))
        break;
    end
    
    tempX = A(i+1);
    A(i+1) = A(j);
    A(j) = tempX;
    tempY = A((i+1)+le);
    A(1+i+le) = A(j+le);
    A(j+le) = tempY;
    
    i = i + 1;
    j = j - 1;
    
end
disp(A);
cords = A;
end