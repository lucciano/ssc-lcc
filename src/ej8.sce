g=9.8;
b_a = 0.1;
m=1;
b=30;
k=100000;
// x(t) > 0
A=[0, 1 ;  0 , - b_a / m];
Ap= A + [0.001, 0; 0, 0];
B = [0; -g];
u = 1;

x0 = [10; 0];
t1 = [0:0.0001:1.47];

x1 = ltisol(Ap,B,u,x0, t1);
//plot(t1,x1);

// x(t) <= 0 
p1 = 14643
A=[0, 1 ;  -k/m , - b / m];
x0 = [0; x1(2,p1)];
t2 = [t1(p1):0.00001:1.50];

x2 = ltisol(A,B,u,x0, t2);
plot(t2,x2);