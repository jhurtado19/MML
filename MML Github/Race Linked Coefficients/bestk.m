% how well did each set of K estimate all years of params. 

amd = [];

for i = 1:width(Constraints)
    c_sid = (i-1)*6 + 1;
    c_eid = i*6;
    
    obs = con_mat(:,c_sid:c_eid);
    dfr = abs(obs-Constraints);
    mdf = mean(dfr);
    amd(i,:) = mdf;
end

k_means = mean(amd,2);