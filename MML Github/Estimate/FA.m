% Feature Analysis 


% Extract Coefficients 
RLC = coefficients(:,1);
RLCw = RLC(1);
RLCb = RLC(2);
RLCl = RLC(3);
RLCa = RLC(4);

% Create feature arrays 

whiteP = Params(:,1:4:end);
blackP = Params(:,2:4:end);
latinoP = Params(:,3:4:end);
apiP = Params(:,4:4:end);

% Calculate Estimates 

white_est = whiteP * RLCw;
black_est = blackP * RLCb;
latino_est = latinoP * RLCl;
api_est = apiP * RLCa;

% Get weights

wfac = raceTotals_WhiteDB(:,1:6)./white_est;
bfac = raceTotals_BlackDB(:,1:6)./black_est;
lfac = raceTotals_LatinoDB(:,1:6)./latino_est;
afac = raceTotals_ApiDB(:,1:6)./api_est;


% solution of the form est .* fac = totals, estimatates to be scaled by
% factors