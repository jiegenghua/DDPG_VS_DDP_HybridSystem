function  [l0,l_x,l_xx,l_u,l_uu,l_ux] = Cost_CartPole(x,u,k,xf)  
global E
nx = size(x,1);
nu = size(u,1);
if isempty(k)
    l0 = 0.5*(x-xf)'*E.Qf*(x-xf);
else
    l0 = 0.5*u'*E.R*u + 0.5*x'*E.Q*x; 
end

% derivatives of cost(contiunuous time)
% will adjust for discrete formulation in main code
if nargout > 1
        l_x = E.Q*x;
        l_xx = E.Q;
        l_u = E.R*u;
        l_uu = E.R;
        l_ux = zeros(nu,nx);
    if isempty(k)     
        l_x = E.Qf*(x-xf);
        l_xx = E.Qf;
    end   
end
end
