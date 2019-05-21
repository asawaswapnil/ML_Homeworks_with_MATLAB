clear
table = readtable("pima.txt");
array = table2array(table);

class_0 = array(array(:,9) == 0,:);
class_1 = array(array(:,9) == 1,:);

% We use this function repeatedly to determine the distribution models of
% different parameters
histogram_analysis(class_1(:,3));
