function d =evalMove(i,j,A)

d=0;
le =length(A);

if(mod((i+1),le)==1)
			%d= A[i].dist(A[j])+A[(i+1)%le-1].dist(A[(j+1)%le])-A[i].dist(A[(i+1)%le-1])-A[j].dist(A[(j+1)%le]);
            d =sqrt(A(i,i)-
            
            % dist mellan [x1,y1] och [x2,y2]
            d=sqrt((A(1,1)-A(1,2))^2 + (A(2,1)-A(2,2))^2); 
            

		if (((j+1)%le)==1 ) { // Special case when j is in the last place of the array
			//Calculating distance for a 2-exchange move.
			d= A[i].dist(A[j])+A[(i+1)%le].dist(A[(j+1)%le-1])-A[i].dist(A[(i+1)%le])-A[j].dist(A[(j+1)%le-1]);

		}
		else { // All other cases.
			//Calculating distance for a 2-exchange move.
			d= A[i].dist(A[j])+A[(i+1)%le].dist(A[(j+1)%le])-A[i].dist(A[(i+1)%le])-A[j].dist(A[(j+1)%le]);
		}

end