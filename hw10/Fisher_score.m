function score=Fisher_score(x,y)
d1=x(y<1);
d2=x(y==1);
m1=mean(d1);
m2=mean(d2);
sd1=std(d1);
sd2=std(d2);
score=(m1-m2).^2/(sd1.^2+ sd2.^2);
end