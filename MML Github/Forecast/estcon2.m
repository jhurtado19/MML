% Estimate Constraints based on computed coefficients 

Est_Constraints = [];

for i = 1:11
    startIdx = (i-1)*4 + 1;
    endIdx = i*4;
    
    % Check if endIdx exceeds the number of columns in ParamsArray
  %  if endIdx > size(Params, 2)
   %     break; % Exit the loop if there are not enough columns left
    %end
    
    x = RLC; % ith column of ConstraintsArray
    A = shitass(:, startIdx:endIdx); % each iteration takes the next group of 4 columns
    b = A*x;
    Est_Constraints(:, i) = b; 

end
