clear; clc;
b=2; nmin=0.9; nmax=1.1;
nois=1; sim('task_E1_mod',10);
figure('Color','w'); hold on; format longe;
plot(x.time,x.data,'o','Color','black','LineWidth',2);
N=length(x.time); S1=0; S2=0;
for k=1:1:N
    S1=S1+x.data(k)*x.time(k);
    S2=S2+x.time(k)^2;
end;
bi=S1/S2;
disp(bi);
plot(x.time,bi*x.time,'-','Color','black','LineWidth',2);
legend('measured data','identification');
FormatCharts('$$t,\textrm{s}$$','$$x(t)$$','');
hold off;