function dx=farmaco(x,t)
    dx=-x
endfunction

//x0 = 1;
//[t,x] = feuler(farmaco, x0,0, 5,0.1);
//plot(t,x);

function dx=masares(x,t)
    m=1;
    k=1;
    b=1;
    F=1;
    dx=[x(2);-k/m*x(1)-b/m*x(2)+ F/m];
endfunction

x0=[0;0];
[t,x] = feuler(masares, x0,0, 10,0.1);
 
//plot(t,x);

function dx=farmaco2(x,t)
    ra=10;
    re=0.1;
    dx=[-ra*x(1) ; ra*x(1) - re*x(2)];
endfunction
x0=[1;0];

[t,x] = feuler(farmaco2, x0,0, 100,0.1);
plot(t,x);
