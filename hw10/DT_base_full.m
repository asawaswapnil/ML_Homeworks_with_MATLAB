function [test_y]  = DT_base_full(tr_x, tr_y, test_x, params)

%%%%%%%%%% Learning DT %%%%%%%%%%%%%%%

new_tree=fitctree(tr_x,tr_y,'splitcriterion','gdi');
%view(new_tree);
%view(new_tree,'Mode','graph');
%%% evaluate the tree on the test data
test_y=predict(new_tree,test_x);
return;