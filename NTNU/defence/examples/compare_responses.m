init_transfers_knut;
ksp = 0;

model_name = 'only_plant';

figure
hold
for Tw = [0.05, 0.075, 1, 1.25]
    for Kp = [7.5, 10, 12.5]
        simout = sim(model_name);
        plot(Pm(:,1), Pm(:,2));
    end
end
grid on
cleanfigure
matlab2tikz ../pictures/fcp_response.tikz

figure
plot(Pm(:,1), Pm(:,2));
grid on
cleanfigure
matlab2tikz ../pictures/fcp_response_one.tikz

f_excitation = timeseries(randn(N,1),t);
figure
plot(t, f_excitation.Data);
grid on
xlim([0,20])
cleanfigure
matlab2tikz ../pictures/res_response.tikz
