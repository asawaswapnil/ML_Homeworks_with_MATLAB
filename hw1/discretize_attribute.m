function y=discretize_attribute(X,k)
mn=min(X,[],1);
mx=max(X,[],1);
r=mx-mn+1;
w=ceil(r/k);
for i=1:length(X)
y(i)=floor(X(i)/w)+1;
end
end
