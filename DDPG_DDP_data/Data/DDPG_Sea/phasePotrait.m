function phasePotrait()
A1 = [-1 0;0 1.5];
A2 = [-1 2;-2 -1];
A3 = [-1 4;-4 -1];
A4 = [-0.5 0;0 -0.7];
A5 = [-0.5 -5;1 -0.5];
A6 = [-1 -5;1 -0.5];
A7 = [-1 0;2 -1];
B = [1;1];

plot([0 10],[5 5], 'k','LineWidth', 2);
plot([0 10],[10 10],'k', 'LineWidth', 2);
plot([0 0],[0 10],'k', 'LineWidth', 2);
plot([0 10],[0 0],'k', 'LineWidth', 2);
plot([3 3],[0 10], 'k','LineWidth', 2);
plot([7 7],[0 10],'k', 'LineWidth', 2);
plot([10 10],[0 10], 'k','LineWidth', 2);
plot(8,8, 'ro','LineWidth', 2);
%%
y1 = linspace(-2,12,20);
y2 = linspace(-2,12,20);
[x1,x2] = meshgrid(y1,y2);
u = zeros(size(x1));
v = zeros(size(x2));
t=0;
for i = 1:numel(x1)
     if x1(i)>=0 &&x1(i)<=3 &&x2(i)>=5 &&x2(i)<=10
        f = @(t,Y) A1*Y;
        Yprime = f(t,[x1(i); x2(i)]); 
    elseif x1(i)>=3 &&x1(i)<=7 &&x2(i)>=5 &&x2(i)<=10
        f = @(t,Y) A2*Y;
        Yprime = f(t,[x1(i); x2(i)]); 
    elseif x1(i)>=7 &&x1(i)<=10 &&x2(i)>=5 &&x2(i)<=10        
        f = @(t,Y) (A3*Y+[8;8]);
        Yprime = f(t,[x1(i); x2(i)]);
        
    elseif x1(i)>=0 &&x1(i)<=3 &&x2(i)>=0 && x2(i)<=5
        f = @(t,Y) A4*Y;
        Yprime = f(t,[x1(i); x2(i)]); 
    elseif x1(i)>=3 && x1(i)<=7 && x2(i)>=0 &&x2(i)<=5
        f = @(t,Y) A5*Y;
        Yprime = f(t,[x1(i); x2(i)]); 
    elseif x1(i)>=7 && x1(i)<=10 &&x2(i)>=0 &&x2(i)<=5
        f = @(t,Y) A6*Y;
        Yprime = f(t,[x1(i); x2(i)]); 
    else
        f = @(t,Y) A7*Y;
        Yprime = f(t,[x1(i); x2(i)]); 
     end
    u(i) = Yprime(1);
    v(i) = Yprime(2);
end
quiver(x1,x2,u,v,'r'); 
end
