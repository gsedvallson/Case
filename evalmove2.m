function d = evalmove2(i,j,A,distance) %(i,j,distance) för depå -> truckstops!

le = length(A);
d=0;

if (j == le)
    
    %d = sqrt((A(1,i)-A(1,j))^2 + (A(2,i)-A(2,j))^2) + sqrt((A(1,i+1)-A(1,1))^2 + (A(2,i+1)-A(2,1))^2) - sqrt((A(1,i)-A(1,i+1))^2 + (A(2,i)-A(2,i+1))^2) - sqrt((A(1,j)-A(1,1))^2 + (A(2,j)-A(2,1))^2);
     d = distance(A(i),A(j)) + distance(A(i+1),A(1)) - distance(A(i),A(i+1)) - distance(A(j),A(1));
else
    
    %d = sqrt((A(1,i)-A(1,j))^2 + (A(2,i)-A(2,j))^2) + sqrt((A(1,i+1)-A(1,j+1))^2 + (A(2,i+1)-A(2,j+1))^2) - sqrt((A(1,i)-A(1,i+1))^2 + (A(2,i)-A(2,i+1))^2)	- sqrt((A(1,j)-A(1,j+1))^2 + (A(2,j)-A(2,j+1))^2);
     d = distance(A(i),A(j)) + distance(A(i+1),A(j+1)) - distance(A(i),A(i+1)) - distance(A(j),A(j+1));
end

end