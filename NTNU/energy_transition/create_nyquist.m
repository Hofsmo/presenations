init_transfers_knut;
%&Tw = 1.5;
[T1,T2,Dg] = linearize_hygov(Pm0, Tw, qnl, At, Dt,w0);
[G0, Gp, Hj,S]= create_G0(T1,T2, At, Tr, r, Tf, Tg, R, H, Kd, Dg,Tdel);
e = abs(dcgain(G0));
s = tf('s');
G_min = 600/0.1*f0/23000*(1/(2*120000/23000*s+0.005*50));
L_min = G_min*Gp*e;
S_min = 1/(1+L_min);

nyquist(S)
%hold
%nyquist(S_min)
figure
nyquist(Gp*Hj)
cleanfigure
%matlab2tikz('pictures/nyquist_L.tikz')
matlab2tikz('pictures/nyquist_L_zoom_out.tikz')
%nyquist(L_min)