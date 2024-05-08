%%
clear; clc;
h=0.005; c=586; ro=7830; lamda=48; T_0=300;
A=[-2/3,2/3,0;1,-2,1;0,1,-2]; A=A*(16*lamda/(c*ro*h^2));
B=[2/3,0;0,0;0,4*lamda/h]; B=B*(4/(c*ro*h));
qa=500000; Tb=350;
%%
sim('task_D1_mod',60);
plot(x.time,x.data);
