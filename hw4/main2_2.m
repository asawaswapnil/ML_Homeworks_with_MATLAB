function [exp,norm_mu,norm_sigma,pri]=main2_2(pima_zeros,pima_ones)

%%% fit the exponential class-conditional for input attribute 1 and class 0
%%% p(x_1|y=0, \mu_0_1)
exp=zeros(8,2);
norm_mu=zeros(8,2);
norm_sigma=zeros(8,2);
pri=zeros(2,1);
for i=[1,5,7,8]
exp(i,2) = expfit(pima_ones(:,i));
exp(i,1) = expfit(pima_zeros(:,i));
end
% exp
for i=[2,3,4,6]
[norm_mu(i,2),norm_sigma(i,2)] =normfit(pima_ones(:,i));
[norm_mu(i,1),norm_sigma(i,1)] = normfit(pima_zeros(:,i));
end
% norm_mu
%norm_sigma
thetha=size(pima_ones,1)/size(pima_zeros,1);
pri(2,1)=thetha;
pri(1,1)=1-thetha;
%pri
end
