function newRoute = makeMove2(iMin,jMin,A)

i = iMin;
j = jMin;
n = 1000;

for k=1:n
    if(j==(i+1) || i == j)
        break;
    end
    temp = A(i+1);
    A(i+1) = A(j);
    A(j) = temp;
    
    i = i + 1;
    j = j - 1;
    
end
newRoute = A;
end