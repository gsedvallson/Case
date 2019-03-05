function d =evalMove(i,j,A)

d=0;
le =length(A) / 2;

% if(mod((i+1),le)==1)
%     %d= A[i].dist(A[j])+A[(i+1)%le-1].dist(A[(j+1)%le])-A[i].dist(A[(i+1)%le-1])-A[j].dist(A[(j+1)%le]);
%     d =sqrt(A(i,i+le(A))-
%     % dist mellan [x1,y1] och [x2,y2]
%     d=sqrt((A(1,1)-A(1,2))^2 + (A(2,1)-A(2,2))^2);
%     
%     
%     if ((mod((j+1),le)==1 )  % Special case when j is in the last place of the array
%         %Calculating distance for a 2-exchange move.
%         d= A(i).dist(A(j))+A(mod((i+1),le)).dist(A(mod((j+1),le-1)))-A(i).dist(A(mod((i+1),le)))-A(j).dist(A(mod((j+1),le-1)));
%         
%     else  % All other cases.
%         %Calculating distance for a 2-exchange move.
%         d= A(i).dist(A(j))+A(mod((i+1),le)).dist(A(mod((j+1),le)))-A(i).dist(A(mod((i+1),le)))-A(j).dist(A(mod((j+1),le)));
%     end
% end
% 



if (j == le - 1)
    %d = A[i].dist(A[j]) + A[i + 1].dist(A[0]) - A[i].dist(A[i + 1]) - A[j].dist(A[0]);
    d = sqrt((A(i)-A(j))^2 + (A(i+le)-A(j+le))^2) + sqrt((A(i+1)-A(1))^2 + (A((i+1)+le)-A(1+le))^2) - sqrt((A(i)-A(i+1))^2 + (A(i+le)-A((i+1)+le))^2) - sqrt((A(j)-A(1))^2 + (A(j+le)-A(1+le))^2);
    
else
    %d = A[i].dist(A[j]) + A[i + 1].dist(A[j + 1]) - A[i].dist(A[i + 1]) - A[j].dist(A[j + 1]);
    d = sqrt((A(i)-A(j))^2 + (A(i+le)-A(j+le))^2) + sqrt((A(i+1)-A(j+1))^2 + (A((i+1)+le)-A((j+1)+le))^2) - sqrt((A(i)-A(i+1))^2 + (A(i+le)-A((i+1)+le))^2)	- sqrt((A(j)-A(j+1))^2 + (A(j+le)-A((j+1)+le))^2);
end

end