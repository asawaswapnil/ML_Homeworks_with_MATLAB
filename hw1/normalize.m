function y=normalize(X)
m=mean(X,1);
v=var(X,1,1);
sd=realsqrt(v);
y=(X-m)/sd;