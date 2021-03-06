close all
clc;
clear all;

%% Defining the mesh
n_points = 5 ;
domain_size = 1 ;
h = domain_size/(n_points-1) ;

%% Initializing the problem
y(n_points,n_points) = 0 ;
y(1,:)=1;

y_new(n_points,n_points) = 0 ;
y_new(1,:)=1;

error_mag = 0.1;
error_req = 1e-6;
iterations=0;

%% Calculations
while error_mag>error_req
    for i=(2:(n_points-1))
            for j =2:(n_points-1)
                y_new(i,j)=0.25*(y(i-1,j)+y(i+1,j)+y(i,j-1)+y(i,j+1));
            end
    end
    
    error_mag = 0 ;
    for i=(1:(n_points-1))
        for j = 2:(n_points-1)
        error_mag = error_mag + abs (y_new(i,j)-y(i,j));
        end
    end
    iterations=iterations+1;
    y=y_new
end

x_dom=((1:n_points)-1).*h;
y_dom=1-((1:n_points)-1).*h;
[X,Y] = meshgrid(x_dom,y_dom);
contourf(X,Y,y, 12)
colorbar