% Mean Absolute Difference 

% which set of coefficients best fits its own data. k-c 1:1

mads = [];

for i = 1:width(coefficients)
    d = abs(Est_Constraints(:,i) - Constraints(:,i));
    md = mean(d);
    mads(i) = md;
end
