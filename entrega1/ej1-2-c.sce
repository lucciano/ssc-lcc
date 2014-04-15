ra=20;
re=1;

A=[-ra,0;ra,-re];
B=[0;0];
u = 0;
x0=[1;0];

t=[0:0.01:8];

x=ltisol(A,B,u,x0, t);
plot(t,x);