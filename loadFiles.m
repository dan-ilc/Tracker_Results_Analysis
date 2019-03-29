switch dataset_id
    case 1
        gnd_truth_file = "gnd_truth_fits/gnd_truth_fits_stationary_1.mat";
    case 2
        gnd_truth_file = "gnd_truth_fits/gnd_truth_fits_walking_1.mat";
    case 3
        gnd_truth_file = "gnd_truth_fits/gnd_truth_fits_walking_2.mat";
    otherwise
        fprintf('invalid dataset ID provided. Exiting')
end


%% loads a bunch of stuff into work place
load(gnd_truth_file);
load('gnd_truth_cells_03_19_10.mat');
gnd_truth_fits = {fit1x, fit1y, fit2x, fit2y, fit3x, fit3y}; % put stuff in a cell array

%% hack: true_tracklet_array
true_tracklet_cell = var_to_save; %better name
clear var_to_save % delete the copy

%% Results
% add spreadsheet folder to path
filepath = '/home/ori/catkin_ws/src/multi_sensor_tracker/results_CSVs';
addpath(filepath)
% results file
res_table = readtable(results_filename);
fprintf('res_table has size (%d,%d)',size(res_table,1),size(res_table,2))
res_table(1:3,:) %print the first few rows

