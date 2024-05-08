%%
clear; clc;
h=0.005; c=586; ro=7830; lamda=48; T_0=300;
A=[-2/3,2/3,0;1,-2,1;0,1,-2]; A=A*(16*lamda/(c*ro*h^2));
B=[2/3,0;0,0;0,4*lamda/h]; B=B*(4/(c*ro*h));
qa=500000; Tb=350; sim('task_D1_mod',10);
%%
for k=1:1:5
    N=k*1123;
    U(k,1)=x.data(N-1,1); U(k,2)=x.data(N-1,2); U(k,3)=x.data(N-1,3); 
    U(k,4)=u.data(N-1,1); U(k,5)=u.data(N-1,2); X(k,1)=x.data(N,1); 
end;
L=transpose(U\X); format shorte; dt=x.time(N)-x.time(N-1);
A1=L(1:3); A1=(A1-[1 0 0])/dt; B1=L(4:5); B1=B1/dt;
disp('full identification:');
disp([A1, B1]); disp([A(1,:),B(1,:)]);
%%
clear U L X;
for k=1:1:5
    N=k*1123;
    U(k,1)=x.data(N-1,1); U(k,2)=x.data(N-1,2); 
    U(k,3)=u.data(N-1,1); X(k,1)=x.data(N,1); 
end;
L=transpose(U\X); format shorte; dt=x.time(N)-x.time(N-1);
A1=L(1:2); A1=(A1-[1 0])/dt; B1=L(3); B1=B1/dt;
disp('intelligent identification:');
disp([[A1,0],[B1,0]]); disp([A(1,:),B(1,:)]);

