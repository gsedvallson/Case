function d = evalMove(i,j,A) 
%Utv�rderar euklidiskt avst�nd

le = length(A);
d=0;

if (j == le)
    
    d = sqrt((A(1,i)-A(1,j))^2 + (A(2,i)-A(2,j))^2) + sqrt((A(1,i+1)-A(1,1))^2 + (A(2,i+1)-A(2,1))^2) - sqrt((A(1,i)-A(1,i+1))^2 + (A(2,i)-A(2,i+1))^2) - sqrt((A(1,j)-A(1,1))^2 + (A(2,j)-A(2,1))^2);
   
else
    
    d = sqrt((A(1,i)-A(1,j))^2 + (A(2,i)-A(2,j))^2) + sqrt((A(1,i+1)-A(1,j+1))^2 + (A(2,i+1)-A(2,j+1))^2) - sqrt((A(1,i)-A(1,i+1))^2 + (A(2,i)-A(2,i+1))^2)	- sqrt((A(1,j)-A(1,j+1))^2 + (A(2,j)-A(2,j+1))^2);
   
end

end