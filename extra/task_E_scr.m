 clear; clc;
 b=2; nmin=0.9; nmax=1.1;
 figure('Color','w'); hold on; format longe;
 disp('without the nois:');
 nois=0; sim('task_E1_mod',10);
 plot(x.time,x.data,'--','Color','black','LineWidth',2);
 len=length(x.time);
 for k=len:-1:len-5
     disp(x.data(k)/x.time(k));
 end;
 FormatCharts('$$t,\textrm{s}$$','$$x(t)$$','');
 disp('with the nois:');
 nois=1; sim('task_E1_mod',10);
 plot(x.time,x.data,'-','Color','black','LineWidth',2);
 len=length(x.time);
 for k=len:-1:len-5
     disp(x.data(k)/x.time(k));
 end;
 FormatCharts('$$t,\textrm{s}$$','$$x(t)$$','');
 hold off;