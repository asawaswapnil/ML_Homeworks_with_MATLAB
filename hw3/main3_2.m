function [mseTrain,mseTest]=main3_2(Train, Test)
W=LR_solve(Train)
yCapTrain=LR_predict(Train(:,1:13),W);
yCapTest=LR_predict(Test(:,1:13),W);
mseTrain=mean((yCapTrain-Train(:,14)).^2);
mseTest=mean((yCapTest-Test(:,14)).^2);