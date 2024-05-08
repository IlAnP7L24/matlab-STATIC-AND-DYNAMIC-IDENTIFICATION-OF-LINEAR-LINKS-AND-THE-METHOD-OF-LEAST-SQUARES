%%
clear; clc;
h=0.005; c=586; ro=7830; lamda=48; T_0=300;
qa=500000; Tb=350; 
A=[-2/3,2/3,0;1,-2,1;0,1,-2]; A=A*(16*lamda/(c*ro*h^2));
B=[2/3,0;0,0;0,4*lamda/h]; B=B*(4/(c*ro*h));
C=[4/3,-1/3,0]; D=[h/(6*lamda),0];

%%
hold on; leg={};
for qa=500000:100000:600000
    for Tb=350:50:400
        sim('task_C1_mod',15);
        legi='{\it q_a}=';
        legi=[legi,num2str(qa/1000)];
        legi=[legi,'kW/m^2; {\it T_b}='];
        legi=[legi,num2str(Tb),'K'];
        leg=[leg,legi];
        plot(y.time,y.data);
    end
end
legend(leg); hold off;


plot(x.time,x.data);