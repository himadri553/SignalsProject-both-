% loop thru all data in deviec folder
%   from each file, average current(plug this into a array)
% plot voltage and average current

% set folder and list of data
folder_path1 = 'C:\Users\himad\OneDrive\OneDrive - UMass Lowell\CurrentSchoolDocs\Signals and Systems I\Signals Project\Optional Project\Project\Device-1';
folder_path2 = 'C:\Users\himad\OneDrive\OneDrive - UMass Lowell\CurrentSchoolDocs\Signals and Systems I\Signals Project\Optional Project\Project\Device-2';
file_list = dir(fullfile(folder_path1, '*.dat'));
% initialize data for part 1
aveCurrentAxis1 = [];
aveCurrentAxis2 = [];
voltageAxis = [0.0, 0.1, 0.5, 1.0, 1.5, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0];

% initialize data for part 2: time and freq axis
time_fsAxis = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13]; % time is fetmoseconds axis??

% Loop through each file
for i = 1:length(file_list)
    % Get the filename and import 
    filename = file_list(i).name;
    data1 = importdata(fullfile(folder_path1, filename)); % list of all data in each file
    data2 = importdata(fullfile(folder_path2, filename));

    % get current data then plug into aveCurrentaxis array (Part 1)
    aveCurrent1 = mean(data1, 1);
    aveCurrent2 = mean(data2, 1);
    aveCurrentAxis1(i) = aveCurrent1;
    aveCurrentAxis2(i) = aveCurrent2;

    % use 'data' to calc fourier transform
    F_tran1 = fft(data1);
    F_tran2 = fft(data2);

    % plot each fft
    figure;
    hold on;
    plot(abs(F_tran1));
    hold off;
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    title('Fourier Transforms Device 1, File #:', num2str(i));

    figure;
    hold on;
    plot(abs(F_tran2));
    hold off;
    xlabel('Frequency (Hz)');
    ylabel('Magnitude');
    title('Fourier Transforms Device 2, File #:', num2str(i));
    
end

% Plot: Part1
figure;
hold on; 
plot(voltageAxis, aveCurrentAxis1, 'o-', 'DisplayName', 'Device 1'); 
plot(voltageAxis, aveCurrentAxis2, 'o-', 'DisplayName', 'Device 2'); 
hold off; 
xlabel('Voltage (V)');
ylabel('Average Current (A)');
title('Part 1: I-V Characteristics'); 
legend('Location', 'best'); 
grid on;
