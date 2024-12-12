% Loop through each region and display model performance metrics
for i = 1:length(regions)
    % Get the regression model for the current region
    mdl = regressionResults{i, 2};
    
    % Display the region name
    fprintf('Region: %s\n', regions{i});
    
    % Display R-squared and Adjusted R-squared
    fprintf('R-squared: %.2f\n', mdl.Rsquared.Ordinary);
    fprintf('Adjusted R-squared: %.2f\n', mdl.Rsquared.Adjusted);
    
    % Display p-values for the coefficients
    fprintf('p-values:\n');
    disp(mdl.Coefficients.pValue);
    
    % Perform ANOVA to get the F-statistic and p-value for the overall model
    anovaResults = anova(mdl, 'summary');
    fprintf('F-statistic: %.2f\n', anovaResults.F(1));
    fprintf('Model p-value: %.4f\n', anovaResults.pValue(1));
    
    % Display RMSE
    fprintf('RMSE: %.2f\n', mdl.RMSE);
    
    % Display MAE
    fprintf('MAE: %.2f\n', mean(abs(mdl.Residuals.Raw)));
    
    % Display a newline for better readability
    fprintf('\n');
end