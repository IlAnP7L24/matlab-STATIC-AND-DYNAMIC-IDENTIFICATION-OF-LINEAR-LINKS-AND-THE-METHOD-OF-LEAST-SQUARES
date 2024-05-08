%%
clear; clc;
h=0.005; c=586; ro=7830; lamda=48; T_0=300;
qa=500000; Tb=350; 
A=[-2/3,2/3,0;1,-2,1;0,1,-2]; A=A*(16*lamda/(c*ro*h^2));
B=[2/3,0;0,0;0,4*lamda/h]; B=B*(4/(c*ro*h));
C=[4/3,-1/3,0]; D=[h/(6*lamda),0];
qa=500000; Tb=350;
nmin=0.9; nmax=1.1;
figure('Color','w'); hold on;
nois=0; sim('task_G_mod',15);
plot(y.time,y.data,'-','Color','black','LineWidth',3);
nois=1; sim('task_G_mod',15);
plot(y.time,y.data,'--','Color','black','LineWidth',2);
FormatCharts('$$t,\textrm{s}$$','$$T_0(t), K$$','');
legend('without the nois','with the nois');
hold off;