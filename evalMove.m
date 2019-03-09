function d = evalMove(i,j,A) %(i,j,distance) för depå -> truckstops!

le = length(A);
d=0;

if (j == le)
    
    d = sqrt((A(1,i)-A(1,j))^2 + (A(2,i)-A(2,j))^2) + sqrt((A(1,i+1)-A(1,1))^2 + (A(2,i+1)-A(2,1))^2) - sqrt((A(1,i)-A(1,i+1))^2 + (A(2,i)-A(2,i+1))^2) - sqrt((A(1,j)-A(1,1))^2 + (A(2,j)-A(2,1))^2);
   %d = distance(i,j) + distance(i+1,1) - distance(i,i+1) - distance(j,1)
   
else
    
    d = sqrt((A(1,i)-A(1,j))^2 + (A(2,i)-A(2,j))^2) + sqrt((A(1,i+1)-A(1,j+1))^2 + (A(2,i+1)-A(2,j+1))^2) - sqrt((A(1,i)-A(1,i+1))^2 + (A(2,i)-A(2,i+1))^2)	- sqrt((A(1,j)-A(1,j+1))^2 + (A(2,j)-A(2,j+1))^2);
   %d = distance(i,j) + distance(i+1,j+1) - distance(i,i+1) - distance(j,j+1)
end

end