function makeMove(iMin,jMin,A)

le = length(A)/2;
j = jMin;
disp("i= " + iMin);
disp("j= " + jMin);

%i=180:-1:1 for j=180:-1:1

for i = iMin+1:j
    tempX = A(i);
    A(i) = A(j);
    A(j) = tempX;
    tempY = A(i+le);
    A(i+le) = A(j+le);
    A(j+le) = tempY;
    
    j = j - 1;
end

disp("cords efter= " + A);

end