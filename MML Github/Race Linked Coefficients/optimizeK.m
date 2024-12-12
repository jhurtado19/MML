% optimal K-coeff

% which set of K best estimates ALL the constraints 
% use each K to estimate set of set contstraints 
% compare each constraint set with the original constraints to get
% mean absolute differences, choose K with least MADs. <-bestk

con_mat = [zeros(17,36)];

for i = 1:width(coefficients)
    c_sid = (i-1)*6 + 1;
    c_eid = i*6;
    for j = 1:width(coefficients)
        startIdx = (j-1)*4 + 1;
        endIdx = j*4;

        x = coefficients(:, i); % ith column of ConstraintsArray
        A = Params(:, startIdx:endIdx); % each iteration takes the next group of 4 columns
        b = A*x;

        int_mat(:,j) = b; 
    end
    con_mat(:, c_sid:c_eid) = int_mat;
end

