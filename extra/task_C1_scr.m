%%
clear; clc;
h=0.005; c=586; ro=7830; lamda=48; T_0=300;
A=[-2/3,2/3,0;1,-2,1;0,1,-2]; A=A*(16*lamda/(c*ro*h^2));
B=[2/3,0;0,0;0,4*lamda/h]; B=B*(4/(c*ro*h));
C=[4/3,-1/3,0]; D=[h/(6*lamda),0];

%%
qa=500000; Tb=350; sim('task_C1_mod',15);
U(1,1)=qa; U(1,2)=Tb; Y(1,1)=y.data(length(y.data));
qa=650000; Tb=403; sim('task_C1_mod',15);
U(2,1)=qa; U(2,2)=Tb; Y(2,1)=y.data(length(y.data));
L=transpose(U\Y);
format longe;
disp(L); disp(D-C*(inv(A)*B));