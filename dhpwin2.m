% Load data for all turbines
WT2 = readtable('data.xlsx', 'Sheet', 'No.2WT');
WT39 = readtable('data.xlsx', 'Sheet', 'No.39WT');
WT14 = readtable('data.xlsx', 'Sheet', 'No.14WT');
WT3 = readtable('data.xlsx', 'Sheet', 'No.3');




% Load data as numeric matrices
WT2 = readmatrix('data.xlsx', 'Sheet', 'No.2WT');
WT39 = readmatrix('data.xlsx', 'Sheet', 'No.39WT');
WT14 = readmatrix('data.xlsx', 'Sheet', 'No.14WT');
WT3 = readmatrix('data.xlsx', 'Sheet', 'No.3');

% Define the number of columns to use (minimum of 25)
numColumns = 25;

% Ensure all datasets have at least `numColumns` columns
WT2 = WT2(:, 1:numColumns);
WT39 = WT39(:, 1:numColumns);
WT14 = WT14(:, 1:numColumns);
WT3 = WT3(:, 1:numColumns);

% Combine data from all turbines
allData = [WT2; WT39; WT14; WT3];

% Number of attributes (columns) and records (rows)
[numRecords, numAttributes] = size(allData);

% Display basic information about the data
fprintf('Number of records (rows): %d\n', numRecords);
fprintf('Number of attributes (columns): %d\n', numAttributes);

% Display the first few rows of the data
disp('First few rows of the data:');
disp(allData(1:5, :));

% Calculate and display basic statistics for each attribute
min_vals = min(allData);
max_vals = max(allData);
means = mean(allData);
medians = median(allData);
std_devs = std(allData);

% Display the statistics
disp('Minimum values:');
disp(min_vals);

disp('Maximum values:');
disp(max_vals);

disp('Means:');
disp(means);

disp('Medians:');
disp(medians);

disp('Standard Deviations:');
disp(std_devs);

% Display the summary statistics in a table format
statsTable = table(min_vals', max_vals', means', medians', std_devs', ...
    'VariableNames', {'Min', 'Max', 'Mean', 'Median', 'StdDev'}, ...
    'RowNames', arrayfun(@num2str, (1:numAttributes)', 'UniformOutput', false));

disp('Summary Statistics Table:');
disp(statsTable);

