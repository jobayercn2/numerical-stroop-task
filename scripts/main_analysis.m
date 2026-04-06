clc; clear; close all;

%% ----------------------------------------
% File list
%% ----------------------------------------
files = {
    'subject-1.csv'
    'subject-2.csv'
    'subject-3.csv'
    'subject-4.csv'
    'subject-5.csv'
    'subject-6.csv'
};

all_data = table();

%% ----------------------------------------
% Load and preprocess data
%% ----------------------------------------
for i = 1:length(files)

    T = readtable(fullfile('../data', files{i}));

    % Add participant ID
    T.participant = i * ones(height(T),1);

    % Assign group (odd vs even)
    if mod(i,2) == 1
        T.group = repmat("odd", height(T), 1);
    else
        T.group = repmat("even", height(T), 1);
    end

    all_data = [all_data; T];
end

% Keep only correct responses
all_data = all_data(all_data.correct == 1, :);

% Convert condition labels
all_data.condition = categorical(all_data.condition, ...
    {'c','i','n'}, {'congruent','incongruent','neutral'});

%% ----------------------------------------
% 1. Group Analysis (Odd vs Even)
%% ----------------------------------------
figure('Name','Group Comparison','Color','w'); hold on;

boxchart(all_data.condition, all_data.response_time_key_response, ...
    'GroupByColor', categorical(all_data.group));

swarmchart(all_data.condition, all_data.response_time_key_response, ...
    8, categorical(all_data.group), ...
    'filled', 'MarkerFaceAlpha', 0.4);

title('Reaction Time by Condition (Odd vs Even Groups)')
xlabel('Condition')
ylabel('Reaction Time (ms)')
ylim([0 2000])
legend('Location','best')
grid on
hold off;

%% ----------------------------------------
% 2. Individual Participant Analysis
%% ----------------------------------------
for p = 1:length(files)

    stroop_data = readtable(fullfile('../data', files{p}));
    stroop_data = stroop_data(stroop_data.correct == 1, :);

    condition = categorical(stroop_data.condition, ...
        {'c','i','n'}, {'congruent','incongruent','neutral'});

    rt = stroop_data.response_time_key_response;

    figure('Name', sprintf('Participant %d', p), 'Color','w');
    hold on;

    boxchart(condition, rt, 'BoxWidth', 0.5);

    swarmchart(condition, rt, 6, ...
        'filled', 'MarkerFaceAlpha', 0.4);

    title(sprintf('Participant %d: Reaction Time', p))
    xlabel('Condition')
    ylabel('Reaction Time (ms)')
    ylim([0 2000])
    grid on
    hold off;
end

%% ----------------------------------------
% 3. Combined Analysis (All Participants)
%% ----------------------------------------
figure('Name','All Participants','Color','w'); hold on;

boxchart(all_data.condition, all_data.response_time_key_response, ...
    'BoxWidth', 0.5);

swarmchart(all_data.condition, all_data.response_time_key_response, ...
    6, 'filled', 'MarkerFaceAlpha', 0.35);

title('Reaction Time (All Participants)')
xlabel('Condition')
ylabel('Reaction Time (ms)')
ylim([0 2000])
grid on
hold off;