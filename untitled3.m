% SSSC Modeling and Application

% Parameters
Vt = 1;        % Terminal voltage (pu)
Zs = 0.02 + 0.1j;    % Series impedance (pu)
Vr = 0.95*Vt;  % Reference voltage (pu)
Xc = 0.1;      % Capacitive reactance (pu)
Xd = 0.6;      % Synchronous reactance (pu)
Xs = Xd - Xc;  % Series reactance (pu)
Vcmax = 1.1;   % Maximum compensator voltage (pu)
Vcmin = 0.9;   % Minimum compensator voltage (pu)

% Frequency
f = 50;        % System frequency (Hz)
w = 2*pi*f;    % Angular frequency (rad/s)

% Time
tStart = 0;    % Simulation start time (s)
tEnd = 0.1;    % Simulation end time (s)
tStep = 0.0001;    % Time step (s)
t = tStart:tStep:tEnd;  % Time vector

% Input Voltage
Vg = Vt*exp(1j*w*t);    % Grid voltage (pu)

% SSSC Compensation
Vc = Vr - Vg;    % Compensator voltage (pu)
Vc = max(min(Vc, Vcmax), Vcmin);    % Limit the compensator voltage (pu)

% SSSC Current
Is = Vc./Zs;    % Series current (pu)

% SSSC Voltage Injection
Vinject = 1j*Xs*Is;    % Voltage injection (pu)

% Output Voltage
Vout = Vg + Vinject;    % Compensated voltage (pu)

% Plotting Results
figure;
subplot(3, 1, 1);
plot(t, abs(Vg), 'b');
hold on;
plot(t, abs(Vout), 'r');
xlabel('Time (s)');
ylabel('Voltage (pu)');
title('Grid Voltage and Compensated Voltage');
legend('Grid Voltage', 'Compensated Voltage');

subplot(3, 1, 2);
plot(t, abs(Vc), 'g');
xlabel('Time (s)');
ylabel('Voltage (pu)');
title('Compensator Voltage');

subplot(3, 1, 3);
plot(t, abs(Vinject), 'm');
xlabel('Time (s)');
ylabel('Voltage (pu)');
title('Voltage Injection');
