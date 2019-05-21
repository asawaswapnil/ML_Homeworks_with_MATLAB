function [train,test]=devideset1(data, p)
train=[];
test=[];
for i=1:length(data)
x=rand;
if x<p
    train=[train;data(i,:)];
else
    test=[test;data(i,:)];
end
end
