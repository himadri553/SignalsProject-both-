% install Control System Toolbox first
% freq
f1 = 700;
f2 = 4 * (10^4);
% Define the cutoff frequency (choose within the range of f1 and f2)
wc = 800; 

% Create the transfer function
num = 1;
den = [1/wc^3, 3/wc^2, 3/wc, 1];
H = tf(num, den);

% Plot the magnitude response
w = logspace(0, 4, 1000); % Frequency range
bode(H, w);
grid on;
title('Magnitude Response of Third-Order Butterworth Filter');
xlabel('Frequency (rad/s)');
ylabel('Magnitude (dB)');
