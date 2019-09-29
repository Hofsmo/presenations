%% Initialize plant 2
A = 100;
Kd=0.5;
D=50;
Td=0;
Tw2=1.01/2;
R = 0.08;
Kp = 10;
Ti = 9.1;
Tf = 0.05;
Ty = 0.2;
Ysp = 0;
backlash = 0;
Tdel=0;

R2 = R;

%% Initialize plant 1
init_knut
Pm0 = 0.8;
w0 = 0;
q0=(Pm0+(At*qnl))/(At-(w0*Dt));
g0 = q0;
c0 = g0;
w_ref=w0+g0*R;
hs = 1;
deadzone=0;
ksp=0;


%% Initialize the  power system
f0 = 50;
W0 = 0;

M1 = 300;
H = 3.5;
M2 = A*M1;
H2 = 9.6;
Kd2 = 0.1;

S_base = M1+M2;
n_p = 1e-2;

Um = 20;
Ub = 400;
k = M1/S_base*Ub^2/Um^2;
k2 = M2/S_base*Ub^2/Um^2;

x1 = 20;
x2 = 0.05;
xd1 = 0.15*k;
xd2 = 0.15*k2/A;

b1 = 1/x1;  
b2 = 1/x2;
bd1 = 1/xd1;
bd2 = 1/xd2;

%% Matrix crap
B = [bd1, 0, -bd1, 0, 0;
    0, bd2, 0, -bd2 0;
    -bd1, 0, bd1 + b1, 0, -b1;
    0, -bd2, 0, bd2+b2, -b2;
    0, 0, -b1, -b2, b1+b2];
Y11 = B(1:2,1:2);
Y12 = B(1:2, 3:5);
Y21 = B(3:5, 1:2);
Y22 = B(3:5, 3:5);
X22 = inv(Y22);

FD = -X22*Y21;

K11 = 2*pi*f0*S_base/M1*bd1*(1-bd1*X22(1,1));
K12 = 2*pi*f0*S_base/M1*bd1*bd2*X22(1,2);
K13 = S_base/M1*bd1*X22(1,3);

K22 = 2*pi*f0*S_base/M2*bd2*(1-bd2*X22(2,2));
K21 = 2*pi*f0*S_base/M2*bd1*bd2*X22(2,1);
K23 = S_base/M2*bd2*X22(2,3);

%% Set parameters for model behavior
T = 1800;
Ts = 0.02;
t = 0:Ts:T;
N = T/Ts+1;  

dW = sqrt(Ts)*randn(N,1);
W = cumsum(dW);   
el = 1e-3;
vl = timeseries(el*W,t);

e1 = el*1e-4;
v1 = timeseries(e1.*randn(N, 1),t);

e2 = el*1e-4;
v2 = timeseries(e2*randn(N, 1),t);

f_excitation = timeseries(el*2*randn(N,1),t);

extra_excitation=0;
freq_control=0;
open=0;

%% FD stuff
FD_f = 1;
FD = -X22*Y21;

%% Ramp stuff
ramp=0;
tls=0;
ramp_rate = 0;
t1=0;