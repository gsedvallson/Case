function makeMove(iMin,jMin,A)

le = length(A)/2;
j = jMin-1;
disp("i= " + iMin);
disp("j= " + jMin);

%i=180:-1:1 for j=180:-1:1

for i = iMin+2:j-1 %j-1 jMin-2
    for j = jMin+1:-1:i+1
        tempX = A(i);
        A(i) = A(j);
        A(j) = tempX;
        tempY = A(i+le);
        A(i+le) = A(j+le);
        A(j+le) = tempY;
        
    end
end

disp(A);

end



