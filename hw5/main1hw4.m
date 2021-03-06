

load pima_train.txt;
load pima_test.txt;
[mean_norm,std_norm]=compute_norm_parameters(pima_train(:,1:8));
[x_train_norm]=normalize(pima_train(:,1:8),mean_norm,std_norm);
x_train_label=pima_train(:,9);

x_test_norm=normalize(pima_test(:,1:8),mean_norm,std_norm);
x_test_label=pima_test(:,9);

%[pgraph]=init_progress_graph;
% for i=0:50:2001
%     %W=Log_regression(pima_train(:,1:8),pima_train(:,9),2000);
%     W=Log_regressionhw4(x_train_norm,x_train_label,i);
% 
%     y_train=logistic_predicthw4(x_train_norm,W);
%     y_test=logistic_predicthw4(x_test_norm,W);
% 
%     %transpose is done because y_predict is 1xn format and data is nx1
%     traine=mean_misclass_error(x_train_label,y_train');
%     teste=mean_misclass_error(x_test_label,y_test');
% 
%     %[pgraph]=add_to_progress_graph(pgraph,i,traine,teste);
% end

W=Log_regressionhw4(x_train_norm,x_train_label,2000);

    y_train=logistic_predicthw4(x_train_norm,W);
    y_test=logistic_predicthw4(x_test_norm,W);
    ycaplr=double(y_train>0.5);
    ytestcaplr=double(y_test>0.5);
     %transpose is done because y_predict is 1xn format and data is nx1
    traine=mean_misclass_error(x_train_label,y_train');
    teste=mean_misclass_error(x_test_label,y_test');
    Clr = confusionmat(x_train_label,ycaplr);
    C2lr= confusionmat(x_test_label,ytestcaplr);
    misclassificationErrorTraininglr=(Clr(1,2)+Clr(2,1))/(Clr(2,1)+Clr(2,2)+Clr(1,1)+Clr(1,2))
    misclassificationErrorTestinglr=(C2lr(1,2)+C2lr(2,1))/(C2lr(2,1)+C2lr(2,2)+C2lr(1,1)+C2lr(1,2))
    sensetivitylr=(Clr(2,2))/(Clr(2,2)+Clr(2,1))
    specificitylr=(Clr(1,1))/(Clr(1,2)+Clr(1,1))
    sensetivitytestlr=(C2lr(2,2))/(C2lr(2,2)+C2lr(2,1))
    specificitytestlr=(C2lr(1,1))/(C2lr(1,2)+C2lr(1,1))
