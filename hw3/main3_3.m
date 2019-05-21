function [W,mseTrain,mseTest]= main3_32(train, test)
[avg,std]= compute_norm_parameters(train(:,1:13));
x_norm=normalize(train(:,1:13),avg,std);
xtest_norm=normalize(test(:,1:13),avg,std);
train_norm=cat(2,x_norm,train(:,14));
test_norm=cat(2,xtest_norm,test(:,14));
W=zeros(1,13);
pgraph=init_progress_graph
for i=1:50:10000
    W=ogd2(train_norm,W,i,i+50);
    YTrainCap=LR_predict(train_norm(:,1:13),W);
    mseTrain=immse(train_norm(:,14),YTrainCap);
    YTestCap=LR_predict(test_norm(:,1:13),W);
    mseTest=immse(test_norm(:,14),YTestCap);
    pgraph=add_to_progress_graph(pgraph,i,mseTrain,mseTest)
end

