function out=predictNB(datapt,pri,exp,norm_mu,norm_sigma)
g=zeros(2,8);
sm0=0;
sm1=0;
for i=[1,5,7,8]
    sm0=sm0+log(exppdf(datapt(1,i),exp(i,1)));
    sm1=sm1+log(exppdf(datapt(1,i),exp(i,2)));
end
for i=[2,3,4,6]
    sm0=sm0+log(normpdf(datapt(1,i),norm_mu(i,1),norm_sigma(i,1)));
    sm1=sm1+log(normpdf(datapt(1,i),norm_mu(i,2),norm_sigma(i,2)));
end
sm0=sm0+log(pri(1,1));
sm1=sm1+log(pri(2,1));
comp=sm1-sm0
if comp>0
    out=1;
else 
    out=0;
end
