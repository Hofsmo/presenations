init_transfers_knut;
ksp = 0;

model_name = 'only_plant';

figure
hold
for Ksp = [0.01, 1, 2, 3, 4, 5]
        simout = sim(model_name);
        plot(Pm(:,1), Pm(:,2));
end
grid on
cleanfigure
matlab2tikz ../pictures/backlash_response.tikz

