clc; close all; clear all;

Nx = 32;
Ny = 32;
Nz = 128;

% copied from geometry_matrix.m
%x(1:51,1:12)  = 0;     % Ag40
%x(13:45,1:9) = 2;     % inconel sheet
%x(19:39,1:6)  = 3;     % Mg0
%x(25:33,1:3)  = 4;      % Ni-Cr

Ag = [1 12
      1 12
      1 51];
      
inconel = [1 9
           1 9
           13 45];
           
MgO = [1 6
       1 6
       19 39];
     
NiCr = [1 3
        1 3
        25 33];  
  
  

      
material = 5 * ones(Nx*Ny*Nz,1);
        
for z = 1 : Nz
  for y = 1 : Ny
    for x = 1 : Nx
      if (x>=Ag(1,1)) && (x<=Ag(1,2)) && (y>=Ag(2,1)) && (y<=Ag(2,2)) && (z>=Ag(3,1)) && (z<=Ag(3,2))
        material((z-1)*Nx*Ny + (y-1)*Nx + x) = 0;
      end
      if (x>=inconel(1,1)) && (x<=inconel(1,2)) && (y>=inconel(2,1)) && (y<=inconel(2,2)) && (z>=inconel(3,1)) && (z<=inconel(3,2))
        material((z-1)*Nx*Ny + (y-1)*Nx + x) = 2;
      end
      if (x>=MgO(1,1)) && (x<=MgO(1,2)) && (y>=MgO(2,1)) && (y<=MgO(2,2)) && (z>=MgO(3,1)) && (z<=MgO(3,2))
        material((z-1)*Nx*Ny + (y-1)*Nx + x) = 3;
      end
      if (x>=NiCr(1,1)) && (x<=NiCr(1,2)) && (y>=NiCr(2,1)) && (y<=NiCr(2,2)) && (z>=NiCr(3,1)) && (z<=NiCr(3,2))
        material((z-1)*Nx*Ny + (y-1)*Nx + x) = 4;
      end
    end
  end
end  

save('geometry3D32x32x128.txt','material','-ascii');  % one column with material indices   

   
        
       
        