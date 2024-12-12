% Loop through each region and plot the regression line
T = black_totals_table;

for i = 1:length(regions)
    % Filter data for the current region
    regionData = T(strcmp(T.Geography, regions{i}), :);
    
    % Prepare the data for regression
    X = regionData.Year;
    y = regionData.Total;
    
    % Fit the regression model
    mdl = fitlm(X, y);
    
    % Predict values
    predictions = predict(mdl, X);
    
    % Plot the data and the regression line
    figure;
    scatter(X, y, 'filled');
    hold on;
    plot(X, predictions, 'r-', 'LineWidth', 2);
    xlabel('Year');
    ylabel('Count');
    title(['Regression Line for ', regions{i}]);
    legend('Data', 'Regression Line');
    hold off;
end