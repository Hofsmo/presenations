init_transfers_knut;
ksp = 0;
Kp=5
model_name = 'test_system_2016a';
        simout = sim(model_name);
           ratio =10;
    Ts = 0.02;
    data = prepare_case(control_e(:,2), [r_excitation(:,2) Pe1(:,2)],ratio, -1, Ts);
    model = arx(data, [20, [20,20],[0 0]]);
    
    [T1,T2,Dg] = linearize_hygov(Pm0, Tw, qnl, At, Dt,w0);
[G0, Gp, Hj,S,Gt,Gc,Gs]= create_G0_PID(T1, T2, At, Ti, Kp, Tf, Td, Tg, R, H, Kd,Dg,Tdel);
    %bode(model(1), 'sd', 2);
    
    bode(-model(2), 'sd', 2);
    hold
    %bode(S)
    bode(G0)
    grid on
    cleanfigure
    matlab2tikz ../pictures/use_case3.tikz