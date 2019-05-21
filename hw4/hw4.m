%Part1 a
load pima_train.txt;
load pima_test.txt;
load pima.txt;
train=pima_train;
[avg,std]= compute_norm_parameters(train(:,1:8))
test=pima_test;
pima_train_norm=train;
pima_train_norm(:,1:8)=normalize(train(:,1:8),avg,std);
pima_test_norm=test;
pima_test_norm(:,1:8)=normalize(test(:,1:8),avg,std)

%1b,c,d,e
main1(train(:,1:8),train(:,9),test(:,1:8),test(:,9))
 %2.1
main2_1()
%2.2
[exp,norm_mu,norm_sigma,pri]=main2_2(pima_zeros,pima_ones)
%2.3
main2_3(train,test,exp,norm_mu,norm_sigma,pri)
%3
