function x=ltisol(A,B,u,x0, t)
    n=length(x0); //orden del sistema
    r=length(t);//numero de puntos en el tiempo
    x=zeros(n,r);
    x(:,1)=x0;
    for k=2:r
        x(:,k)=expm(A*t(k))*x0 + inv(A)*(expm(A*t(k)) - eye(n,n)) * B *u;
    end
endfunction
