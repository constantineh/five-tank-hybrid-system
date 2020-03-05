clear all;
clc;

%% Simulink Five-Tank System Parameters with added uncertainty

% Tanks
A1u=0.0573+0.00286;     % m^2 Cross sectional area of tank 1 +5% uncertainty
A2u=0.0573+0.00286;     % m^2 Cross sectional area of tank 2 +5% uncertainty
A3u=0.0346+0.0017;     % m^2 Cross sectional area of tank 3 +5% uncertainty
A4u=0.0346+0.0017;     % m^2 Cross sectional area of tank 4 +5% uncertainty
A5u=0.0707+0.00353;     % m^2 Cross sectional area of tank 5 +5% uncertainty

% Valves
% Filling Valves
Av1u=3.167e-5+6.33e-6;  % m^2 cross section area of the valve 3 +20% uncertainty
cv1u=0.62-0.0615;      % valve flow coefficient 3 + 10% uncertainty
Av2u=3.167e-5+6.33e-6;  % m^2 cross section area of the valve 4 +20% uncertainty
cv2u=0.62-0.0615;      % valve flow coefficient 4 + 10% uncertainty

% Connection Valves
Av3u=3.167e-5+6.33e-6;  % m^2 cross section area of the valve 1 +20% uncertainty
cv3u=0.37-0.0365;      % valve flow coefficient 1 + 10% uncertainty
Av4u=3.167e-5+6.33e-6;  % m^2 cross section area of the valve 2 +20% uncertainty
cv4u=0.37-0.0365;      % valve flow coefficient 2 + 10% uncertainty

% Outflow pipes
Ap1u=3.167e-5+6.33e-6;  % m^2 cross section area of the valve 1 +20% uncertainty
cp1u=0.68-0.0675;      % valve flow coefficient 1 + 10% uncertainty
Ap2u=3.167e-5+6.33e-6;  % m^2 cross section area of the valve 2 +20% uncertainty
cp2u=0.68-0.0675;      % valve flow coefficient 2 + 10% uncertainty
Ap3u=3.167e-5+6.33e-6;  % m^2 cross section area of the valve 3 +20% uncertainty
cp3u=0.4-0.038;      % valve flow coefficient 3 + 10% uncertainty
Ap4u=3.167e-5+6.33e-6;  % m^2 cross section area of the valve 4 +20% uncertainty
cp4u=0.4-0.038;      % valve flow coefficient 4 + 10% uncertainty
Ap5u=3.167e-5+6.33e-6;  % m^2 cross section area of the valve 5 +20% uncertainty
cp5u=0.7-0.068;      % valve flow coefficient 5 + 10% uncertainty

g = 9.81;   % standard gravity


%% Initial Conditions
x1_0=0.3;        % tank 1 water level [m]
x2_0=0.12;       % tank 2 water level [m]
x3_0=0.15;       % tank 3 water level [m]
x4_0=0.3;        % tank 4 water level [m]
x5_0=0.09;       % tank 5 water level [m]

% Tanks parametric failures % m leakage hole radious 0<rho<0.1 thus 0<rho^2<0.01
rho1 = 0.005;
rho2 = 0.005;
rho3 = 0.005;
rho4 = 0.005;
rho5 = 0.0063;

% simulation details
T = 1000;  % simulation time in sec
Ts = 0.01; % time step
N = T/Ts;

% Noise
v=0.02;     % noise 5% in max state value i.e. 0.4m
xi=0.02;    % saturation bound on noise

%% Five Tank System System Nominal Parameters

% Tanks
A1=0.0573;     % m^2 Cross sectional area of tank 1
A2=0.0573;     % m^2 Cross sectional area of tank 2
A3=0.0346;     % m^2 Cross sectional area of tank 3
A4=0.0346;     % m^2 Cross sectional area of tank 4
A5=0.0707;     % m^2 Cross sectional area of tank 5

X1max=0.4;      % m Max height of tank 1
X1min=0.1;      % m Min height of tank 1
X2max=0.4;      % m Max height of tank 2
X2min=0.1;      % m Min height of tank 2
X3max=0.35;     % m Max height of tank 3
X3min=0.1;      % m Min height of tank 3
X4max=0.35;     % m Max height of tank 4
X4min=0.1;      % m Min height of tank 4
X5max=0.2;      % m Max height of tank 5
X5min=0.05;     % m Min height of tank 5

X1overflow=0.405;
X2overflow=0.405;
X3overflow=0.355;
X4overflow=0.355;
X5overflow=0.205;

% Valves
% Filling Valves
Av1=3.167e-5;  % m^2 cross section area of the valve 3
cv1=0.62;      % valve flow coefficient 3
Av2=3.167e-5;  % m^2 cross section area of the valve 4
cv2=0.62;      % valve flow coefficient 4

% Connection Valves
Av3=3.167e-5;  % m^2 cross section area of the valve 1
cv3=0.37;      % valve flow coefficient 1
Av4=3.167e-5;  % m^2 cross section area of the valve 2
cv4=0.37;      % valve flow coefficient 2

% Outflow pipes
Ap1=3.167e-5;  % m^2 cross section area of the valve 1
cp1=0.68;      % valve flow coefficient 1
Ap2=3.167e-5;  % m^2 cross section area of the valve 2
cp2=0.68;      % valve flow coefficient 2
Ap3=3.167e-5;  % m^2 cross section area of the valve 3
cp3=0.4;      % valve flow coefficient 3
Ap4=3.167e-5;  % m^2 cross section area of the valve 4
cp4=0.4;      % valve flow coefficient 4
Ap5=3.167e-5;  % m^2 cross section area of the valve 5
cp5=0.7;      % valve flow coefficient 5


