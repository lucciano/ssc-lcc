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

x2 = ltisol(A,B,u,x0, t2 - t1(p1));



// x(t) > 0 
p2=2987;
x0 = [0; x2(2,p2)];
t3 = [t2(p2):0.001:(t2(p2))+ 3];
x3 = ltisol(Ap,B,u,x0, t3 - t2(p2));

p3 = 1693
// x(t) <= 0 
x0 = [0; x3(2,p3)];
t4 = [t3(p3):0.00001:((t3(p3))+ 1)];
x4 = ltisol(A,B,u,x0, t4 - t3(p3));

p4=998;
// x(t) > 0 
x0 = [0; x4(2,p4)];
t5 = [t4(p4):0.001:((t4(p4))+ 1.5)];
x5 = ltisol(Ap,B,u,x0, t5 - t4(p4));

p5=1382;
x0 = [0; x5(2,p5)];
t6 = [t5(p5):0.00001:((t5(p5))+ 3)];
x6 = ltisol(A,B,u,x0, t6 - t5(p5));

p6=997;

x0 = [0; x6(2,p6)];
t7 = [t6(p6):0.001:((t6(p6))+ 3)];
x7 = ltisol(Ap,B,u,x0, t7 - t6(p6));

p7=1139;

t1 = t1(1:p1);
x1 = x1(1:2, 1:p1);
plot(t1,x1);

t2 = t2(1:p2);
x2 = x2(1:2, 1:p2);
plot(t2,x2);

t3 = t3(1:p3);
x3 = x3(1:2, 1:p3);
plot(t3,x3);

t4 = t4(1:p4);
x4 = x4(1:2, 1:p4);
plot(t2,x2);

t5 = t5(1:p5);
x5 = x5(1:2, 1:p5);
plot(t5,x5);

t6 = t6(1:p6);
x6 = x6(1:2, 1:p6);
plot(t6,x6);

t7 = t7(1:p7);
x7 = x7(1:2, 1:p7);
plot(t7,x7);