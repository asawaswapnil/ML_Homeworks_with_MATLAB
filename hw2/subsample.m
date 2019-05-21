function newdata=subsample(data,k)
d=length(data);
indices = randperm(d);
indices=indices(1:k);
newdata= data(indices);
end

 