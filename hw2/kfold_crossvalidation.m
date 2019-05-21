function [train, test] = kfold_crossvalidation(data, k, m)
subSize=length(data)/k;
modSize=mod(length(data),k);
subSets=[];
for i=(1:modSize)
    subSets=[subSets;((i-1)*subSize+i:i*subSize+i)];
end
for j=(modSize+1:k)
    subSets=[subSets;((j-1)*subSize+modSize+1 :j*subSize+modSize)];
end
trainSets=subSets;
trainSets(m,:)=[];
trainind=trainSets ;
trainind=reshape(trainind,1,[]);
testind=subSets(m,:);
train=data(trainind);
test=data(testind);
end
            
