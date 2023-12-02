%% colors set
c1 = [0, 0.4470, 0.7410]; c2 = [0.8500, 0.3250, 0.0980]; 
c3 = [0.9290, 0.6940, 0.1250]; c4 =[0.4940, 0.1840, 0.5560];
c5 = [0.4660, 0.6740, 0.1880]; c6 = [0.3010, 0.7450, 0.9330]; 
c7 = [0.6350, 0.0780, 0.1840]; c8 = [0, 0, 1];
c9 = [0, 0.5, 0]; c10 = [0.75, 0.75, 0];
%% state
figure(1)
hold on
plot([-5 -5],[-6 -5], 'k','LineWidth', 2);
plot([-10 -5],[-5 -5],'k', 'LineWidth', 2);
plot([-5 -2],[-5 -2], 'k','LineWidth', 2);
plot([-2 5],[-2 -2],'k', 'LineWidth', 2);
plot([-2 -2],[-2 2], 'k','LineWidth', 2);
plot(-8,-6, 'ro','LineWidth', 2);
plot(state(1,:), state(2,:),'r','LineWidth', 2);
plot(state1.x1(1:end-1),state1.x2(1:end-1),'Color',c1,'LineWidth', 2);
plot(state2.x1(1:end-1),state2.x2(1:end-1),'Color',c2,'LineWidth', 2);
plot(state3.x1(1:end-1),state3.x2(1:end-1),'Color',c3,'LineWidth', 2);
plot(state4.x1(1:end-1),state4.x2(1:end-1),'Color',c4,'LineWidth', 2);
plot(state5.x1(1:end-1),state5.x2(1:end-1),'Color',c5,'LineWidth', 2);
plot(state6.x1(1:end-1),state6.x2(1:end-1),'Color',c6,'LineWidth', 2);
plot(state7.x1(1:end-1),state7.x2(1:end-1),'Color',c7,'LineWidth', 2);
plot(state8.x1(1:end-1),state8.x2(1:end-1),'Color',c8,'LineWidth', 2);
plot(state9.x1(1:end-1),state9.x2(1:end-1),'Color',c9,'LineWidth', 2);
plot(state10.x1(1:end-1),state10.x2(1:end-1),'Color',c10,'LineWidth', 2);
xlabel('$x_1$','FontSize', 18,'Interpreter','Latex'); 
ylabel('$x_2$','FontSize', 18,'Interpreter','Latex');
axis square
%% control
figure(2)
hold on
time = state1.t(1:end-1);
plot(time,control,'r','LineWidth', 2);
plot(time,control1.u,'Color',c1,'LineWidth', 2);
plot(time,control2.u,'Color',c2,'LineWidth', 2);
plot(time,control3.u,'Color',c3,'LineWidth', 2);
plot(time,control4.u,'Color',c4,'LineWidth', 2);
plot(time,control5.u,'Color',c5,'LineWidth', 2);
plot(time,control6.u,'Color',c6,'LineWidth', 2);
plot(time,control7.u,'Color',c7,'LineWidth', 2);
plot(time,control8.u,'Color',c8,'LineWidth', 2);
plot(time,control9.u,'Color',c9,'LineWidth', 2);
plot(time,control10.u,'Color',c10,'LineWidth', 2);
xlabel('$t$','FontSize', 18,'Interpreter','Latex');
ylabel('$u$','FontSize', 18,'Interpreter','Latex');

%% cost
h=figure(3);
curves = zeros(1,11);
hold on
episodes = 1:300;
curves(1) = plot(episodes, 77.3122*ones(1,300),'r','LineWidth', 2);
curves(2) = plot(episodes, -reward1.cost,'Color',c1,'LineWidth', 2); 
curves(3) = plot(episodes, -reward2.cost,'Color',c2,'LineWidth', 2);
curves(4) = plot(episodes, -reward3.cost,'Color',c3,'LineWidth', 2); 
curves(5) = plot(episodes, -reward4.cost,'Color',c4,'LineWidth', 2);
curves(6) = plot(episodes, -reward5.cost,'Color',c5,'LineWidth', 2); 
curves(7) = plot(episodes, -reward6.cost,'Color',c6,'LineWidth', 2);
curves(8) = plot(episodes, -reward7.cost,'Color',c7,'LineWidth', 2); 
curves(9) = plot(episodes, -reward8.cost,'Color',c8,'LineWidth', 2);
curves(10) = plot(episodes, -reward9.cost,'Color',c9,'LineWidth', 2); 
curves(11) = plot(episodes, -reward10.cost,'Color',c10,'LineWidth', 2);
xlabel('Episode','FontSize', 18); 
ylabel('$J$','FontSize', 18,'Interpreter','Latex');
ax = gca(h);
axes('position',[0.5,0.5,0.35,0.35]);
box on
ind = 280:300;
plot(episodes(ind), 77.3122*ones(1,21),'r','LineWidth', 2); hold on
plot(episodes(ind), -reward1.cost(ind),'Color',c1,'LineWidth', 2);  hold on
plot(episodes(ind), -reward2.cost(ind),'Color',c2,'LineWidth', 2); hold on
plot(episodes(ind), -reward3.cost(ind),'Color',c3,'LineWidth', 2); hold on
plot(episodes(ind), -reward4.cost(ind),'Color',c4,'LineWidth', 2); hold on
plot(episodes(ind), -reward5.cost(ind),'Color',c5,'LineWidth', 2); hold on
plot(episodes(ind), -reward6.cost(ind),'Color',c6,'LineWidth', 2); hold on
plot(episodes(ind), -reward7.cost(ind),'Color',c7,'LineWidth', 2); hold on
plot(episodes(ind), -reward8.cost(ind),'Color',c8,'LineWidth', 2); hold on
plot(episodes(ind), -reward9.cost(ind),'Color',c9,'LineWidth', 2);  hold on
plot(episodes(ind), -reward10.cost(ind),'Color',c10,'LineWidth', 2);hold on
axis tight;
%%
R = [reward1.cost(end),reward2.cost(end),reward3.cost(end),reward4.cost(end),reward5.cost(end),reward6.cost(end),...
    reward7.cost(end),reward8.cost(end),reward9.cost(end),reward10.cost(end)];
aveReward = mean(-R);
stdReward = std(-R);


