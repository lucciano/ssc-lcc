//Ejercicio P1-1
//load('ltisol.sci');
A=-9.8;
B=1;
u=1;
t=[0:0.05:2];
x0=0;
    x=ltisol(A,B,u,x0, t);
plot(t,x);