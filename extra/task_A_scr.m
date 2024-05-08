m=0.01; beta=0.05; c=5;
A=[0,1;-c/m,-beta/m]; B=[0;1];
sim('task_A_mod',5);
subplot(2,1,1); plot(x.time,x.data(:,1));
subplot(2,1,2); plot(x.time,x.data(:,2));