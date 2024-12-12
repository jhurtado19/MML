% using the mean of coefficients to estimate constraints 

mc_est = [zeros(size(Constraints))];

for j = 1:6
        startIdx = (j-1)*4 + 1;
        endIdx = j*4;

        x = mc;
        A = Params(:, startIdx:endIdx); % each iteration takes the next group of 4 columns
        b = A*x;

        mc_est(:,j) = b; 
end

mcd = mean(abs(mc_est - Constraints));
carl = mean(mcd,2);
