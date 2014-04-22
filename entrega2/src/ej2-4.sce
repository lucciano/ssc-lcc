function [t,x]=cyclic_euler(A,x0,t0,tf,h)
    FE = eye(A) + A * h;
    BE = inv(eye(A) - A * h);
    t=[t0:h:tf];
    x=zeros(length(x0), length(t));
    x(:,1)=x0;
    for k=1:length(t)-1
        if modulo(k,2) == 1  then
            x_kp1 = FE * x(:,k);
        else 
            x_kp1 = BE * x(:,k);
        end
       x(:,k+1) = x_kp1;
    end
endfunction
u=0;
B=zeros(x0);
x0 = [1 ; -2];
ti = 0;
tf = 25;
A = [0 , 1 ; -9.01, 0.2];
h = 0.01
[t,x] = cyclic_euler(A,x0,ti,tf,h);
x_a=ltisol(A,B,u,x0, t);
err = norm(x_a - x)/(norm(x))