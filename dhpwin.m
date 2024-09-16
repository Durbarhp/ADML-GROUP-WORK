% Load data for all turbines
WT2 = readtable('data.xlsx', 'Sheet', 'No.2WT');
WT39 = readtable('data.xlsx', 'Sheet', 'No.39WT');
WT14 = readtable('data.xlsx', 'Sheet', 'No.14WT');
WT3 = readtable('data.xlsx', 'Sheet', 'No.3');


% Define the attributes to plot
attributes = [10, 15, 20];

% Loop through each turbine dataset
turbines = {WT2, WT39, WT14, WT3};
for i = 1:length(turbines)
    turbine = turbines{i};
    data = table2array(turbine);  % Convert table to array if not already
    
    % Create a figure for box plots
    figure;
    
    % Prepare data for boxplot
    boxData = [];
    labels = {};
    for j = 1:length(attributes)
        attrIndex = attributes(j);
        if attrIndex <= size(data, 2) % Check if attribute index is within bounds
            boxData = [boxData; data(:, attrIndex)'];  % Collect data for the box plot
            labels{end+1} = ['Attribute ', num2str(attrIndex)];
        else
            disp(['Attribute ', num2str(attrIndex), ' is out of bounds for turbine ', num2str(i)]);
        end
    end

    % Create box plot
    boxplot(boxData', 'Labels', labels);
    title(['Box Plot for Selected Attributes (Turbine ', num2str(i), ')']);
    xlabel('Attributes');
    ylabel('Values');
    grid on;
end


% Load and combine data
WT2 = table2array(readtable('data.xlsx', 'Sheet', 'No.2WT'));
WT39 = table2array(readtable('data.xlsx', 'Sheet', 'No.39WT'));
WT14 = table2array(readtable('data.xlsx', 'Sheet', 'No.14WT'));
WT3 = table2array(readtable('data.xlsx', 'Sheet', 'No.3'));



% Check the data type
disp(class(WT2));
disp(class(WT39));
disp(class(WT14));
disp(class(WT3));