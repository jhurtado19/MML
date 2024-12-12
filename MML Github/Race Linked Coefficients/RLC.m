% Script for computing coefficients from the constraints matrix and
% parameters

coefficients = [zeros(4,6)];

for i = 1:width(Constraints)
    startIdx = (i-1)*4 + 1;
    endIdx = i*4;
    
    % Check if endIdx exceeds the number of columns in ParamsArray
    if endIdx > 24
       break; % Exit the loop if there are not enough columns left
    end
    
    b = Constraints(:, i); % ith column of ConstraintsArray
    A = Params(:, startIdx:endIdx); % each iteration takes the next group of 4 columns
    
    x = A\b; % matrix decomposition
    coefficients(:, i) = x; % store estimates in the array
end

