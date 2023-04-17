clc
clear


%set_param(gcs,'DataTypeOverride','Off');
% --- parameters ---
a1 =1.1;%1; %1.9
a2 =1.0101;%1; %2.3
b=2.17;%10.17;%10.17; % 2.5
B=2.0096;%.0096001;%2.0096;%2.009;
M=1;%1;
%clear B;
% These commands must be executed from inside your function 
% evalin('B','save B.mat');
% evalin('M','save B.mat');
ka=1;%0.004199;%-0.0109;%-0.04199;
kb=0.1%0.101;%93555e-6;%0.0099999;%0.0029999;
delta=100;
% e1 = 1;
% e2 = 1;
%Filter = 10;
beta=1e-4;%1.3e-2;%-1.2e-4;%1.55e-4;%25e-9;%25e-9;%0.00019;%0.000000119;%0.000001; %2
%% communication delays
d_m2s = 2; % x Ts
d_s2m = 2; % x Ts
d_mean = 5;
d_var = 5; %variance from mean in random delay

% %% Prefilter
% Fc = 1;

%% Sample time
Ts = 0.001;

%% Quantization error
eQ_s = 2*pi/4096;
eQ_m = 2*pi/4096;


%% velocity estimation
Fc_vel = 10;
beta_s = 2*pi*Fc_vel*Ts;
beta_m = 2*pi*Fc_vel*Ts;


%% Master/Slave Motor constants
% Kt2c_m = 1.182; % torque -> current
% Kt2c_s = 1.182; % torque -> current
% maxCurrent_m = 4.5; % ampere
% maxCurrent_s = 4.5; % ampere
% Kc2v_m = 2; % current -> voltage
% Kc2v_s = 2; % current -> voltage
% k_m = 19.34;
% k_s = 19.34;
% tau_m = 1.217;
% tau_s = 1.217;


%% Environment PD
lArm_m = 0.1; % m
lArm_s = 0.1; % m
qe = 10; % environment position (rad)
Be = 5;
Ke = 100;

% %% Numerical derivative
% Flp = 10; %[Hz]
% Ts = 0.001;
% beta = 2*pi*Flp*Ts;


%% Human PD
Kp_h = 1.2;
Kd_h = 0.5;
Fc_h = 5; % (Hz)

%% Human ARM
Jh = 0.02;
Bh = 0.02;


%% Passivity controller gains for master robot
Kp_m = 1;%1e-1;%1e-1; %0.01;
Kd_m = 0.5;%0.5e-1;%0.5e-1; %0.005;

%% Passivity controller gains for slave robot
Kp_s = 1;%2e-1;%1.05e-2;
Kd_s = 0.5;%6.11e-4;%6.11e-4;%6.5e-4;%0.6565e-1;

%% Master/Slave Motor constants
Kt2c_m = 1.182; % torque -> current
Kt2c_s = 1.182; % torque -> current
maxCurrent_m = 4.5; % ampere
maxCurrent_s = 4.5; % ampere
Kc2v_m = 4.5; % current -> voltage
Kc2v_s = 4.5; % current -> voltage
k_m = 19.34;
k_s = 19.34;
tau_m = 1.217;
tau_s = 1.217;





% 
% 
% 
% 
% %% Mech and Elect parameters
% L = 0.0000025; % [H]
% R = 0.434; % [Ohm]
% J = 0.50; % [kg m^2]
% B = 0.010; % [Nm / (rad/s)]
% Km = 2; % [Nm / A]
% Ke = 2; % [V / (rad/s)]
% Jl = 0.03;
% Bl = 0.02;
% N =1;
% 
% %% Limits
% Vmax = 10; % [V]
% Imax = 4.5; % [A]
% 
% 
% %% Prefilter
% Fc = 20;
% 
% %% Controller
% kp = 5;
% ki = 0.1;
% 
% 
% %% fdt
% s = tf('s');
% G_V2vel = Km/((L*s+R)*(J*s+B)+Ke*Km);
% G_V2pos = G_V2vel/s;
% 
% 
% 
% % %%parametri controllore
% % Kp = 5;
% % Ki = 0;
% % Kd = 0;
% % 
% % % 
% % Ts = 0.5; 
% 
