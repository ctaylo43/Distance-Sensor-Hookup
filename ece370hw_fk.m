% Given------------
L0 = 0.3;
L1 = 0.2;
L2 = 0.1;

t0 = 0.4;
t1 = 0.6;
t2 = 1.2;

%-------------------
disp('Coordinates from formula')
x = L0*cos(t0)+L1*cos(t0+t1)+L2*cos(t0+t1+t2)
y = L0*sin(t0)+L1*sin(t0+t1)+L2*sin(t0+t1+t2)

%-------------------
x0 = [ cos(t0)   -sin(t0) 0   0;
       sin(t0)   cos(t0)  0   0;
       0            0           1   0;
       0            0           0   1 ];
x1 = [ cos(t1)   -sin(t1) 0   0;
       sin(t1)   cos(t1)  0   0;
       0            0           1   0;
       0            0           0   1 ];
x2 = [ cos(t2)   -sin(t2) 0   0;
       sin(t2)   cos(t2)  0   0;
       0            0           1   0;
       0            0           0   1 ];

% Generate identity matrices along with respective last rows
y0 = [eye(4,3) [L0; 0; 0; 1]];
y1 = [eye(4,3) [L1; 0; 0; 1]];
y2 = [eye(4,3) [L2; 0; 0; 1]];

tt0 = x0*y0;
tt1 = x1*y1;
tt2 = x2*y2;

% final transform matrix
transform = tt0*tt1*tt2

t0deg = rad2deg(t0);
t1deg = rad2deg(t1);
t2deg = rad2deg(t2);

rotate_z = t0deg + t1deg + t2deg