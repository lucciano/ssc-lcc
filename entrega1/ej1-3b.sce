b = 1;
m = b;
k = m;
x0=[0;0];
A=[1,0;-k/m,-b/m];
B=[0;1/m];

t=[0:0.01:10];
u=1;

x=ltisol(A,B,u,x0, t);

plot(t,x);