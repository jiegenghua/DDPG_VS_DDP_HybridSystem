cost_all = EpisodeCost.cost;
n=300;
figure(1);
hold on
i = 1;
while i<length(cost_all)
    plot(cost_all(i:i+n-1))
    i = i+n;   
end