main2_2

table = readtable("pima_test.txt");
test_array = table2array(table);

p_y_1 = size(class_1, 1)/(size(class_1, 1)+size(class_0, 1));
p_y_0 = size(class_0, 1)/(size(class_1, 1)+size(class_0, 1));


% The following file has Script to predict and create two output arrays 
% named 'output_train' and 'output_test' which have First column in 
% predicted outcome, second column is probability P(y = 1|x)
% and the third column is the true class
% This uses the function predict_NB
predict_labels

% C_test and C_train are the confusion matrices
C_test = confusionmat(test_array(:,9),output_test(:,1));
C_train = confusionmat(train_array(:,9),output_train(:,1));
missclass_test = mean_misclass_error(test_array(:,9),output_test(:,1));
missclass_train = mean_misclass_error(train_array(:,9),output_train(:,1));


