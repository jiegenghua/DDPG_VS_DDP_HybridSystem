%% DDP for multi region problem
clear all;  close all; format compact
global E
% Final Time
Tf = 2;
dt = 0.01;
horizon = Tf/dt;
t_k = linspace(0,Tf,horizon);
num_iter = 200;
u0 = 0;
x0 = [-8 -6]';
target = [0 0]';
E.Qf = zeros(length(target), length(target));   % no terminal cost
E.R  = 1;
E.Q  = diag([1 1]);
u_k = zeros(1,horizon-1);   % Initial Control:
gamma = 0.5;                % Learning Rate:
reg_con = 0.001;            % regularization constant - default is 1e-5;
%%
datain.gamma = gamma;
datain.auxdata.target = target;
datain.xo = x0;
datain.u_k = u_k;
datain.num_iter = num_iter;
datain.t_k = t_k;
datain.Horizon = horizon;
datain.dt = dt;
datain.Tf = Tf;
datain.reg_con = reg_con;
datain.EOMfile = @EOM_CartPole;
datain.COSTfile = @(x_,u_,t_,target) Cost_CartPole(x_,u_,t_,target);

tic;
sol = DDP_discrete(datain);
toc;

PlotResults(sol);    % plot result


