% Define input and output variables
ACE1 = readfis('ACE1.fis');  % Load ACE1 fuzzy inference system
ACE2 = readfis('ACE2.fis');  % Load ACE2 fuzzy inference system

% Simulate two-area LFC system with fuzzy plus PI controller
sim('two_area_lfc_fuzzy_pi.mdl');  % Simulate the Simulink model

% Plot results
figure;
subplot(2, 1, 1);
plot(t, ACE1_output);
xlabel('Time (s)');
ylabel('Area 1 Control Error');
title('Area Control Errors');

subplot(2, 1, 2);
plot(t, ACE2_output);
xlabel('Time (s)');
ylabel('Area 2 Control Error');