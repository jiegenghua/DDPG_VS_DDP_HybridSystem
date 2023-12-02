function PlotResults(sol)
time = sol.time;
state = sol.state;
control = sol.control;
cost = sol.cost;
K = sol.gain;
l = sol.l;
save('DDP_MultiRegion.mat','state','control')
% Plot Results

figure('Position',[300 100 624 564]);
subplot(2,2,1)
hold on
plot([-5 -5],[-6 -5], 'b','LineWidth', 2);
plot([-10 -5],[-5 -5],'b', 'LineWidth', 2);
plot([-5 -2],[-5 -2], 'b','LineWidth', 2);
plot([-2 5],[-2 -2],'b', 'LineWidth', 2);
plot([-2 -2],[-2 2], 'b','LineWidth', 2);
plot(0,0, 'ro','LineWidth', 2);
plot(state(1,:), state(2,:),'LineWidth',2);
xlabel('Time[s]');
ylabel('state');
    
% Plot cost vs number of iterations
subplot(2,2,2)
plot(cost,'LineWidth',2);
xlabel('Time[s]');
ylabel('Cost');

% Plot controller 
subplot(2,2,3)
hold on
plot(time, state(1,:),'LineWidth',2);
plot(time, state(2,:),'LineWidth',2);
plot(time, control,'LineWidth',2);
plot([0 2],[-5 -5]);
plot([0 2],[-2 -2]);

xlabel('Time[s]');
ylabel('Control');
legend('x1','x2','u');

% Plot controller gains
subplot(2,2,4)
newK=reshape(K,[size(state,1), size(control,2)-1]);
plot(time(1:size(control,2)-1), newK(1,:),'LineWidth',2); hold on
plot(time(1:size(control,2)-1), newK(2,:),'LineWidth',2); hold on
xlabel('Time[s]');
ylabel('Gains');
legend('K','k');

end







      
