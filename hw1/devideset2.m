function [train,test]=devideset2(data, p)
train=[];
test=[];
l=length(data);
perm = randperm(l);
train=data(perm(1:p*l),:);
test=data(perm(p*l+1:l),:);
end
