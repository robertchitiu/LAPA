nx=10;
ny=10;
ni=nx*ny;
V =zeros(nx,ny);
V(1:ny)=1;
x=zeros(nx,2);
T=V;
Bc=1;
for k=1:ni
    
 for i=1:nx     
        for j=1:ny
            if (Bc==0) %for fixing the sides
                if (i==1 & j>1 & j<ny)
                    T(i,j)=0; end
                if (i==nx & j>1 & j<ny)
                    T(i,j)=0;end
            else
                if (i==1 & j>1 & j<ny) %top array condition
                T(i,j)=(T(i+1,j)+T(i,j+1)+T(i,j-1))./3; end
                if (i==nx & j>1 & j<ny) %bottom array condition
                T(i,j)=(T(i-1,j)+T(i,j+1)+T(i,j-1))./3; end
            end
            
            if (i>1 & i<nx & j>1 & j<ny) %middle of the array condition
                T(i,j)=(T(i+1,j)+T(i-1,j)+T(i,j+1)+T(i,j-1))./4;
                
            end 
          
              
          
          %hold on;
            
        end
end
   pause(0.1);
   surf(T)
end

figure (2)
[EX,EY]=gradient(T);
quiver (-EX',-EY',1)
