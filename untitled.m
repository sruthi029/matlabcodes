% SSSC Modelling in MATLAB

% System parameters
Vbase = 230;   % Base voltage (kV)
Sbase = 1000;  % Base power (MVA)
fbase = 60;    % Base frequency (Hz)
Zbase = Vbase^2 / Sbase; % Base impedance (ohm)

% SSSC parameters
Vcomp = 1.1 * Vbase; % Compensation voltage (kV)
Xcomp = 0.2 * Zbase; % Compensation reactance (ohm)

% Load impedance
Zload = 0.8 * Zbase; % Load impedance (ohm)

% Frequency and time
f = 60;              % Operating frequency (Hz)
t = 0:1/(10*f):1;    % Time vector (s)

% Voltage source
Vsource = Vbase * sqrt(2) * sin(2*pi*f*t); % Source voltage (kV)

% Compensation voltage
Vcompensator = Vcomp * sqrt(2) * sin(2*pi*f*t + pi); % Compensation voltage (kV)

% Current calculation
Iload = Vsource ./ Zload; % Load current (A)
Icompensator = Vcompensator ./ Xcomp; % Compensation current (A)
Iseries = Iload + Icompensator; % Total series current (A)

% Power flow calculation
Pload = real(Vsource .* conj(Iload)) / 1000; % Load power (MW)
Pcompensator = real(Vcompensator .* conj(Icompensator)) / 1000; % Compensation power (MW)
Pseries = real(Vsource .* conj(Iseries)) / 1000; % Total series power (MW)

% Plotting results
subplot(3, 1, 1);
plot(t, Vsource, 'r', 'LineWidth', 1.5);
hold on;
plot(t, Vcompensator, 'b', 'LineWidth', 1.5);
hold off;
ylabel('Voltage (kV)');
legend('Source Voltage', 'Compensation Voltage');

subplot(3, 1, 2);
plot(t, Iload, 'r', 'LineWidth', 1.5);
hold on;
plot(t, Icompensator, 'b', 'LineWidth', 1.5);
plot(t, Iseries, 'g', 'LineWidth', 1.5);
hold off;
ylabel('Current (A)');
legend('Load Current', 'Compensation Current', 'Total Series Current');

subplot(3, 1, 3);
plot(t, Pload, 'r', 'LineWidth', 1.5);
hold on;
plot(t, Pcompensator, 'b', 'LineWidth', 1.5);
plot(t, Pseries, 'g', 'LineWidth', 1.5);
hold off;
ylabel('Power (MW)');
xlabel('Time (s)');
legend('Load Power', 'Compensation Power', 'Total Series Power');