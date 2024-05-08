%%
clear; clc;
h=0.005; c=586; ro=7830; lamda=48; T_0=300;
qa=500000; Tb=350; 
A=[-2/3,2/3,0;1,-2,1;0,1,-2]; A=A*(16*lamda/(c*ro*h^2));
B=[2/3,0;0,0;0,4*lamda/h]; B=B*(4/(c*ro*h));
C=[4/3,-1/3,0]; D=[h/(6*lamda),0];
nmin=0.9; nmax=1.1; nois=1;
disp('direct identification:');
qa=500000; Tb=350; sim('task_F_mod',8);
U(1,1)=qa; U(1,2)=Tb; Y(1,1)=y.data(length(y.data));
qa=600000; Tb=400; sim('task_F_mod',8);
U(2,1)=qa; U(2,2)=Tb; Y(2,1)=y.data(length(y.data));
L=transpose(U\Y); format longe; disp(L); disp(D-C*(inv(A)*B));
disp('least square method identification:');
U11=0; U12=0; U22=0; y1=0; y2=0; k=0;
for qa=500000:100000:600000
    for tb=350:5:400
        k=k+1; sim('task_F_mod',8);
        U11=U11+qa^2; U12=U12+qa*Tb; U22=U22+Tb^2;
        y1=y1+qa*y.data(length(y.data));
        y2=y2+Tb*y.data(length(y.data));
    end
end;
U=[U11,U12;U12,U22]; Y=[y1;y2];
L=transpose(U\Y); format longe; disp(k); disp(L); disp(D-C*(inv(A)*B));
