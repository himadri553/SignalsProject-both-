% install Control System Toolbox first
% freq
f1 = 500;
f2 = 5 * (10^4);

% Define the cutoff frequency (choose within the range of f1 and f2)
wc = 800*2*pi; 
w = logspace(0, 4, 1000); % Frequency range

% component values
R = 1;
L_one = 3/2;
L_two = 1/2;
cap = 4/3;

% transfer function with components
num = R;
den = [(wc^3)*(L_one*L_two*cap), (wc^2)*(L_one*cap*R), (wc)*(L_two+L_one), R];
H_comp = tf(num, den);

% transfer funtion 2
num1 = 1;
den1 = [1, 3*wc, 3*wc^2, wc^3];
H1 = tf(num, den1);

% ideal low pass filter
H_ideal = tf(1, [1/wc, 1]);

% Plot the magnitude response
bode(H_comp, w);
hold on;
%{
bode(H1, w);
%}
grid on;
title('Magnitude Response of Third-Order Butterworth Filter');
xlabel('Frequency (rad/s)');
ylabel('Magnitude (dB)');
legend('H_comp', '');
hold off;
