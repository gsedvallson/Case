function d = evalmove2(i,j,A,distance) 
%Utv�rderar givet avst�nd fr�n datafil

le = length(A);
d=0;

if (j == le)
    
     d = distance(A(i),A(j)) + distance(A(i+1),A(1)) - distance(A(i),A(i+1)) - distance(A(j),A(1));
     
else
    
     d = distance(A(i),A(j)) + distance(A(i+1),A(j+1)) - distance(A(i),A(i+1)) - distance(A(j),A(j+1));
     
end

end