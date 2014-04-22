function l=lma(F,x,y)
h=sqrt(x^2+y^2);
A=[0,1;-1,2*x/h];
l=max(abs(spec(eval(F))));
endfunction

F='(eye(A) + h/2 * A)  * inv(eye(A) - h/2 * A)'; //ciclico
F='1/2 * ((eye(A) + h * A) + inv(eye(A) - h * A))'; //mixto
//F='(eye(A) + h * A) * 0 + (1-0) * inv(eye(A) - h * A)'; //metodo-
//F='(eye(A) + h * A) * 0.1 + (1-0.1) * inv(eye(A) - h * A)'; //metodo-
//F='(eye(A) + h * A) * 0.2 + (1-0.2) * inv(eye(A) - h * A)'; //metodo-
//F='(eye(A) + h * A) * 0.24 + (1-0.24) * inv(eye(A) - h * A)'; //metodo-
//F='(eye(A) + h * A) * 0.249 + (1-0.249) * inv(eye(A) - h * A)'; //metodo-
//F='(eye(A) + h * A) * 0.25 + (1-0.25) * inv(eye(A) - h * A)'; //metodo-
//F='(eye(A) + h * A) * 0.251 + (1-0.251) * inv(eye(A) - h * A)'; //metodo-
//F='(eye(A) + h * A) * 0.26 + (1-0.26) * inv(eye(A) - h * A)'; //metodo-
//F='(eye(A) + h * A) * 0.3 + (1-0.3) * inv(eye(A) - h * A)'; //metodo-
//F='(eye(A) + h * A) * 0.5 + (1-0.5) * inv(eye(A) - h * A)'; //metodo-
//F='(eye(A) + h * A) * 0.8 + (1-0.8) * inv(eye(A) - h * A)'; //metodo-
//F='(eye(A) + h * A) * 1 + (1-1) * inv(eye(A) - h * A)'; //metodo-

//F='eye(A)+A*h';

//F='inv(eye(A)-A*h+(A*h)^2/2-(A*h)^3/6+(A*h)^4/24)';
//F='inv(eye(A)-A*h+(A*h)^2/2-(A*h)^3/6)';
//F='eye(A)+A*h+(A*h)^2/2+(A*h)^3/6';
//F='eye(A)+A*h+(A*h)^2/2';
//F='inv(eye(A)-A*h)';
//F='eye(A)+A*h+(A*h)^2/2+(A*h)^3/6+(A*h)^4/24';
//F='[zeros(A),eye(A),zeros(A);zeros(A),zeros(A),eye(A);25/144*(A*h)^2,-A*h/12-5/9*(A*h)^2,eye(A)+13/12*A*h+115/144*(A*h)^2]'

//F='(eye(A)+A*h)*0.24+inv(eye(A)-A*h)*0.76';
//F='(eye(A)+A*h*0.5)*inv(eye(A)-A*h*0.5)';
//F='[18/11*inv(eye(A)-6/11*A*h),-9/11*inv(eye(A)-6/11*A*h),2/11*inv(eye(A)-6/11*A*h);eye(A),zeros(A),zeros(A);zeros(A),eye(A),zeros(A)]';
//F='[2*h*A,eye(A);eye(A),zeros(A)]';

gridx=[-1:0.02:1]*10;
gridy=[0.0001:0.02:1]*10;
nx=length(gridx);
ny=length(gridy);
l1=ones(nx,ny);
for kx=1:nx
  for ky=1:ny
    l1(kx,ky)=lma(F,gridx(kx),gridy(ky))-1;
  end
end
xset("fpf"," ")  

contour(gridx,gridy,l1,[0 0])  
contour(gridx,-gridy,l1,[0 0])  
plot (1,1)
plot(-1,-1)


