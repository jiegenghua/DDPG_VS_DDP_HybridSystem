 function [dXdt, xdot_x, xdot_u] = EOM_CartPole(x, u)
EPS = 1e-5;
A1 = [-1 2;-2 -1];
A2 = [-2 -2; 1 -0.5];
A3 = [-0.5 -5; 1 -0.5];
A4 = [-1 0;2 -1];
B = [1;1];
m = size(x,2);
for i=1:m
    if x(2,i) < -5 && x(1,i) < -5
        dXdt(:,i) = A1*x(:,i)+B*u(i);
    elseif x(2,i) >= -5 && x(1,i) <= -2 && x(1,i)-x(2,i) <= 0
        dXdt(:,i) = A2*x(:,i)+B*u(i);
    elseif  x(1,i) >= -5 && x(1,i)-x(2,i) > 0 && x(2,i) <= -2
        dXdt(:,i) = A3*x(:,i)+B*u(i);
    elseif x(1,i) > -2 && x(2,i) > -2
        dXdt(:,i) = A4*x(:,i)+B*u(i);
    end
end


%----------- compute xdot_x using finite differences ------------
if nargout>1
    nx = size(x,1);
    nu = size(u,1);
    x1 = repmat(x, [1,nx]) + eye(nx)*EPS;
    x2 = repmat(x, [1,nx]) - eye(nx)*EPS;
    uu = repmat(u,[1,nx]);
    
    f1 = EOM_CartPole(x1,uu);
    f2 = EOM_CartPole(x2,uu);
    
    xdot_x = (f1-f2)/2/EPS;
    
    u1 = repmat(u, [1,nu]) + eye(nu)*EPS;
    u2 = repmat(u, [1,nu]) - eye(nu)*EPS;
    xx = repmat(x,[1,nu]);
    
    g1 = EOM_CartPole(xx,u1);
    g2 = EOM_CartPole(xx,u2);
    
    xdot_u = (g1-g2)/2/EPS;
  
end

end

