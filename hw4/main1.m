%% Logistic regression using batch gradient descend

function W=main1(X,Y,Xtest,Ytest)
K=2500;
col_ones = ones(size(X, 1), 1);
X = horzcat(col_ones, X);           % add a column of ones on the left to X
W =ones(size(X, 2), 1);            % initialize W to 1 to start with 
col_ones = ones(size(Xtest, 1), 1);
Xtest = horzcat(col_ones, Xtest);           % add a column of ones on the left to X
pgraph=init_progress_graph
size(Xtest)
size(W)
size(Ytest)
for k = 1:1:K                       %%% number of steps
    sum_err = 0;                    %%% initialize batch error function gradient
    for row = 1:1:size(X, 1)
        x = X(row,:)';
        y = Y(row,:);
        f = 1/(1 + exp(-(W'*x)));
        err = (y - f) * x;          % error (on-line gradient)
        sum_err = sum_err + err;    % update batch error function gradient
    end
    
    alpha = 2/sqrt(k)/size(X,1);
    W = W + (alpha * sum_err);
    if mod(k,100)==0        %plot only after 100 updates to increase the speed
        YTrainCap=LR_predict(X,W);
        mseTrain=immse(Y,YTrainCap);
        YTestCap=LR_predict(Xtest,W);
        mseTest=immse(Ytest,YTestCap);
      pgraph=add_to_progress_graph(pgraph,k,mseTrain,mseTest)
    end
end
outtrain=YTrainCap;
outtest=YTestCap;
for i=(1:size(X,1))
 if YTrainCap(i)>0.5
 outtrain(i)=1;
 else
     outtrain(i)=0;
 end
end
for i=(1:size(Xtest,1))
 if YTestCap(i)>0.5
 outtest(i)=1;
 else
      outtest(i)=0;
 end 
end
outtrain
outtest

C = confusionmat(Y,outtrain)
C2= confusionmat(Ytest,outtest)

misclassificationErrorTraining=(C(1,2)+C(2,1))/(C(2,1)+C(2,2)+C(1,1)+C(1,2))
misclassificationErrorTesting=(C2(1,2)+C2(2,1))/(C2(2,1)+C2(2,2)+C2(1,1)+C2(1,2))

sensetivity=(C(2,2))/(C(2,2)+C(1,2))
specificity=(C(1,1))/(C(1,2)+C(1,1))
end   