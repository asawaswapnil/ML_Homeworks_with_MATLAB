function W=LR_solve(data)
X=data(:,1:13);
Y=data(:,14);
Xt=transpose(X);
Wt= (Xt*X)\(Xt*Y);
W=transpose(Wt);