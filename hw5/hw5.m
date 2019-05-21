clear;
load pima_train.txt;
load pima_test.txt;
Y=pima_train(:,9);
Ytest=pima_test(:,9);

[W,b] =svml(pima_train(:,1:8),pima_train(:,9), 1)

ycap=apply_svlm(pima_train(:,1:8),W,b);
ytestcap=apply_svlm(pima_test(:,1:8),W,b);
C = confusionmat(Y,ycap)
C2= confusionmat(Ytest,ytestcap)
misclassificationErrorTraining=(C(1,2)+C(2,1))/(C(2,1)+C(2,2)+C(1,1)+C(1,2))
misclassificationErrorTesting=(C2(1,2)+C2(2,1))/(C2(2,1)+C2(2,2)+C2(1,1)+C2(1,2))
sensetivity=(C(2,2))/(C(2,2)+C(2,1))
specificity=(C(1,1))/(C(1,2)+C(1,1))
sensetivitytest=(C2(2,2))/(C2(2,2)+C2(2,1))
specificitytest=(C2(1,1))/(C2(1,2)+C2(1,1))

pred=predict(pima_test(:,1:8),W,b);
[xauc,yauc,t,auc] = perfcurve(Ytest,pred,1)
plot(xauc,yauc,'g')
auc
hold on;

main1hw4
[xauclr,yauclr,t,auclr] = perfcurve(Ytest,ytestcaplr,1)
plot(xauclr,yauclr,'b')
auclr
hold on;


main2_3
[xaucnb,yaucnb,t,aucnb] = perfcurve(Ytest,ytestcapnb(:,2),1)
plot(xaucnb,yaucnb,'r')
aucnb
