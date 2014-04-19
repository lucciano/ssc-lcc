//ej2-3.sce
function [t,x]=mixed_euler(A,x0,t0,tf,h)
    FE = eye(A) + A * h;
    BE = inv(eye(A) - A * h);
    t=[t0:h:tf];
    x=zeros(length(x0), length(t));
    x(:,1)=x0;
    for k=1:length(t)-1
       x_fe = FE * x(:,k);
       x_be = BE * x(:,k);
       x(:,k+1) = (x_fe + x_be)/ 2
    end
endfunction

x0 = [1 ; -2];
ti = 0;
tf = 25;
A = [0 , 1 ; -9.01, 0.2];
function dx=ej23(x,t)
      dx=A * x
endfunction
h = 0.0001;
u=0;
B=zeros(x0);
[t,x] = feuler(ej23,x0,ti,tf,h);
x_a=ltisol(A,B,u,x0, t);
//plot(t,x_a);
//plot(t,x);
err = norm(x_a - x)/(norm(x))

[t,x] = beuler(ej23,x0,ti,tf,h);
err2 = norm(x_a - x)/(norm(x))

h = 0.01;
[t,x] = mixed_euler(A,x0,ti,tf,h);
x_a=ltisol(A,B,u,x0, t);
err3 = norm(x_a - x)/(norm(x))