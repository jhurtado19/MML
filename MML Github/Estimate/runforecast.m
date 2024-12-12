% Forecast 
RLCw = RLC(1);
RLCb = RLC(2);
RLCl = RLC(3);
RLCa = RLC(4);

W = ForecastYears(:,1:11);
B = ForecastYears(:,12:22);
H = ForecastYears(:,23:33);
A = ForecastYears(:,34:44);

W = table2array(W);
B = table2array(B);
H = table2array(H);
A = table2array(A);

W_est = W*RLCw;
B_est = B*RLCb;
H_est = H*RLCl;
A_est = A*RLCa;

WFM = mean(wfac,2);
BFM = mean(bfac,2);
HFM = mean(lfac,2);
AFM = mean(afac,2);

WFM = table2array(WFM);
BFM = table2array(BFM);
HFM =table2array(HFM);
AFM = table2array(AFM);

AFM(isnan(AFM)) = 1;
AFM(isinf(AFM)) = 1;
AFM(AFM == 0) = 1;
HFM(HFM == 0) = 1;
BFM(BFM == 0) = 1;

w_for = W_est .* WFM;
b_for = B_est .* BFM;
h_for = H_est .* HFM;
a_for = A_est .* AFM;