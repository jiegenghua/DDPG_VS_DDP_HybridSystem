figure(1)
hold on
plot([-5 -5],[-10 -5], 'k','LineWidth', 2);
plot([-10 -5],[-5 -5],'k', 'LineWidth', 2);
plot([-5 -2],[-5 -2], 'k','LineWidth', 2);
plot([-2 10],[-2 -2],'k', 'LineWidth', 2);
plot([-2 -2],[-2 10], 'k','LineWidth', 2);
%%
y1 = linspace(-10,10,20);
y2 = linspace(-10,10,20);
[x1,x2] = meshgrid(y1,y2);
u = zeros(size(x1));
v = zeros(size(x2));
t=0;
for i = 1:numel(x1)
    if x2(i) < -5 && x1(i) < -5
        f = @(t,Y) [-Y(1)+2*Y(2); -2*Y(1)-Y(2)];
        Yprime = f(t,[x1(i); x2(i)]); 
    elseif x2(i) >= -5 && x1(i) <= -2 && x1(i)-x2(i) <= 0
        f = @(t,Y) [-Y(1)-2*Y(2) ; Y(1)-0.5*Y(2)];
        Yprime = f(t,[x1(i); x2(i)]); 
    elseif  x1(i) >= -5 && x1(i)-x2(i) > 0 && x2(i) <= -2
        f = @(t,Y) [-0.5*Y(1)-5*Y(2) ; Y(1)-0.5*Y(2)];
        Yprime = f(t,[x1(i); x2(i)]); 
    elseif x1(i) > -2 && x2(i) > -2
        f = @(t,Y) [-Y(1);2*Y(1)-Y(2)];
        Yprime = f(t,[x1(i); x2(i)]); 
    end
    
    u(i) = Yprime(1);
    v(i) = Yprime(2);
end
quiver(x1,x2,u,v,'r'); 
figure(gcf)
xlabel('$x_1$','FontSize', 18,'Interpreter','Latex')
ylabel('$x_2$','FontSize', 18,'Interpreter','Latex')
axis tight equal;

