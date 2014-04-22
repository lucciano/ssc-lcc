A=[1250, -25113 , -60050 , -42647 , -23999 ;
   500 , -10068 , -24057 , -17092 ,  -9613 ;
   250 ,  -5060 , -12079 ,  -8586 ,  -4826 ;
  -750 ,  15101 ,  36086 ,  25637 ,  14420 ;
   250 ,  -4963 , -11896 ,  -8438 ,  -4756 ]
   
function dotx=fp21(x,t)
  dotx=A * x
endfunction

B = zeros(5,1);
u = 1;

x0 = [1 ; -2 ; 3 ; -4 ; 5];

t = [0:0.01:10];

x_a=ltisol(A,B,u,x0, t);

//plot(t,x);

t0 = 0;
tf= 10;
h = 0.001;
[t,x]=feuler(fp21,x0,t0,tf,h);

x_a=ltisol(A,B,u,x0, t);

//plot(t,x_a);

err1 = norm(x - x_a) / norm(x_a)

//F=inv(eye(A) - A * h)
h = 0.001;
[t,x]=beuler(fp21,x0,t0,tf,h);
x_a=ltisol(A,B,u,x0, t);
err2 = norm(x - x_a) / norm(x_a)