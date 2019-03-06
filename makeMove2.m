function makeMove2(iMin,jMin,A)

le = length(A)/2;
i = iMin;
j = jMin;
n = 1000;

for k=1:n
    if(j==(i+1))
        break;
    end
    tempX = A(i);
    A(i) = A(j);
    A(j) = tempX;
    tempY = A(i+le);
    A(i+le) = A(j+le);
    A(j+le) = tempY;
    
    i = i + 1;
    j = j - 1;
    
end
disp(A);
end