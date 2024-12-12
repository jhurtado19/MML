% Initialize a cell array to store the results
regressionResults = {};

% Get unique regions
regions = unique(black_totals_table.Geography);

% Loop through each region and perform linear regression
for i = 1:length(regions)
    % Filter data for the current region
    regionData = black_totals_table(strcmp(black_totals_table.Geography, regions{i}), :);
    
    % Perform linear regression
    mdl = fitlm(regionData.Year, regionData.Total);
    
    % Store the results
    regressionResults{i, 1} = regions{i};
    regressionResults{i, 2} = mdl;
    
    % Display the regression model
    fprintf('Region: %s\n', regions{i});
    disp(mdl);
end