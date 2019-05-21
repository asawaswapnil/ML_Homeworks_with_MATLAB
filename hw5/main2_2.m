
load pima_train.txt


class_0 = pima_train(pima_train(:,9) == 0,:);
class_1 = pima_train(pima_train(:,9) == 1,:);

[exp_0_1_muhat exp_0_1_muci] = expfit(class_0(:,1));
[exp_0_5_muhat exp_0_5_muci] = expfit(class_0(:,5));
[exp_0_7_muhat exp_0_7_muci] = expfit(class_0(:,7));
[exp_0_8_muhat exp_0_8_muci] = expfit(class_0(:,8));
[exp_1_1_muhat exp_1_1_muci] = expfit(class_1(:,1));
[exp_1_5_muhat exp_1_5_muci] = expfit(class_1(:,5));
[exp_1_7_muhat exp_1_7_muci] = expfit(class_1(:,7));
[exp_1_8_muhat exp_1_8_muci] = expfit(class_1(:,8));

[norm_0_2_mu,norm_0_2_sigma] = normfit(class_0(:,2));
[norm_0_3_mu,norm_0_3_sigma] = normfit(class_0(:,3));
[norm_0_4_mu,norm_0_4_sigma] = normfit(class_0(:,4));
[norm_0_6_mu,norm_0_6_sigma] = normfit(class_0(:,6));
[norm_1_2_mu,norm_1_2_sigma] = normfit(class_1(:,2));
[norm_1_3_mu,norm_1_3_sigma] = normfit(class_1(:,3));
[norm_1_4_mu,norm_1_4_sigma] = normfit(class_1(:,4));
[norm_1_6_mu,norm_1_6_sigma] = normfit(class_1(:,6));

