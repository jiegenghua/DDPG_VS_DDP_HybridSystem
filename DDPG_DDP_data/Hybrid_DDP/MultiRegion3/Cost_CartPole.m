function  [l0,l_x,l_xx,l_u,l_uu,l_ux] = Cost_CartPole(x,u,k,xf)  
global E
nx = size(x,1);
nu = size(u,1);
R1 = 0.5;
R2 = 0.5;
R3 = 5;
R4 = 0.5;
Q1 = [0.5 0;0 0.5];
Q2 = [R2 0; 0 R2];
Q3 = [R3 0; 0 R3];
Q4 = [0.5 0; 0 0.5];
if isempty(k)
    l0 = 0.5*(x-xf)'*E.Qf*(x-xf);
else
   for i=1:size(x,2)
    if x(2,i) < -5 && x(1,i) < -5
         l0(i) = u(i)*R1*u(i) + x(:,i)'*Q1*x(:,i); 
    elseif x(2,i) >= -5 && x(1,i) <= -2 && x(1,i)-x(2,i) <= 0
         l0(i) = u(i)*R2*u(i) + x(:,i)'*Q2*x(:,i); 
    elseif  x(1,i) >= -5 && x(1,i)-x(2,i) > 0 && x(2,i) <= -2
         l0(i) = u(i)*R3*u(i) + x(:,i)'*Q3*x(:,i); 
    elseif x(1,i) > -2 && x(2,i) > -2
         l0(i) = u(i)*R4*u(i) + x(:,i)'*Q4*x(:,i); 
    end
    end
end

% derivatives of cost(contiunuous time)
% will adjust for discrete formulation in main code
l_x = zeros(size(x,1), size(x,2));
l_u = zeros(size(u,1), size(u,2));

l_ux = zeros(nu,nx);
for i=1:size(x,2)
    if x(2,i) < -5 && x(1,i) < -5
        l_x(:,i) = Q1*x(:,i);
        l_xx = Q1;
        l_u(i) = R1*u(i);
        l_uu = R1;
    elseif x(2,i) >= -5 && x(1,i) <= -2 && x(1,i)-x(2,i) <= 0
        l_x(:,i) = Q2*x(:,i);
        l_xx = Q2;
        l_u(i) = R2*u(i);
        l_uu = R2;
    elseif  x(1,i) >= -5 && x(1,i)-x(2,i) > 0 && x(2,i) <= -2
        l_x(:,i) = Q3*x(:,i);
        l_xx = Q3;
        l_u(i) = R3*u(i);
        l_uu = R3;
    elseif x(1,i) > -2 && x(2,i) > -2
        l_x(:,i) = Q4*x(:,i);
        l_xx = Q4;
        l_u(i) = R4*u(i);
        l_uu = R4;
    end
end
if isempty(k)     
    l_x = E.Qf*(x-xf);
    l_xx = E.Qf;
end   

end
