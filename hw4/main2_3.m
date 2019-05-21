function[y] = main2_3(traindata,testdata,exp,norm_mu,norm_sigma,pri)
n=size(traindata,1);
n
size(traindata)
outtrain=zeros(n,1);
for i=1:n
    outtrain(i)=predictNB(traindata(i,1:8),pri,exp,norm_mu,norm_sigma);
end

n2=size(testdata,1)
n2
outtest=zeros(n2,1)
for i=1:n2
    outtest(i)=predictNB(testdata(i,1:8),pri,exp,norm_mu,norm_sigma);
end
% "hello"
% (n2)
% size(testdata)
% size(outtest)
% size(traindata)
% size(outtrain)
C = confusionmat(traindata(:,9),outtrain)
C2= confusionmat(testdata(:,9),outtest)

misclassificationErrorTraining=(C(1,2)+C(2,1))/(C(2,1)+C(2,2)+C(1,1)+C(1,2))
misclassificationErrorTesting=(C2(1,2)+C2(2,1))/(C2(2,1)+C2(2,2)+C2(1,1)+C2(1,2))

sensetivity=(C(2,2))/(C(2,2)+C(1,2))
specificity=(C(1,1))/(C(1,2)+C(1,1))
y=0;
end 