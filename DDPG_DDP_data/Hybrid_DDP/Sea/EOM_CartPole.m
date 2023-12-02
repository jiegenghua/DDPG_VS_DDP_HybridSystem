 function [dXdt, xdot_x, xdot_u] = EOM_CartPole(x, u)
EPS = 1e-5;
m = size(x,2);
A1 = [-1 0;0 1.5];
A2 = [-1 2;-2 -1];
A3 = [-1 4;-4 -1];
A4 = [-0.5 0;0 -0.7];
A5 = [-0.5 -5;1 -0.5];
A6 = [-1 -5;1 -0.5];
A7 = [-1 0;2 -1];
B = [1;1];

for i=1:m
    x0 = x(:,i);
    x1=x0(1); x2=x0(2);
    if x1>=0 &&x1<=3 &&x2>=5 &&x2<=10
         dXdt(:,i) = A1*x0+B*u(i);
    elseif x1>=3 &&x1<=7 &&x2>=5 &&x2<=10
         dXdt(:,i) = A2*x0+B*u(i);
    elseif x1>=7 &&x1<=10 &&x2>=5 &&x2<=10
         dXdt(:,i) = A3*x0+B*u(i);
    elseif x1>=0 &&x1<=3 &&x2>=0 && x2<=5
         dXdt(:,i) = A4*x0+B*u(i);
    elseif x1>=3 && x1<=7 && x2>=0 &&x2<=5
         dXdt(:,i) = A5*x0+B*u(i);
    elseif x1>=7 && x1<=10 &&x2>=0 &&x2<=5
         dXdt(:,i) = A6*x0+B*u(i);
    else
        dXdt(:,i)= A7*x0+B*u(i); 
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

