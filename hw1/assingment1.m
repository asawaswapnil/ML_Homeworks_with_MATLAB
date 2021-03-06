v= [9 5 10]
u =[4;1;3]
A=[1,2,3;4,5,6]
B=[7 1 9;2 2 3;4 8 6]
C=[8,6,5;1,-3,4;-1,-2,4]
ut=transpose(u)
utrans_u=ut*u
u_utrans=u*ut
VMulU=v*u
UPlus5=u+5
Atrans=transpose(A)
BMulU=B*u
Binv=inv(B)
BPlusC=B+C
BMinusC= B-C
AMulB= A*B
BMulC= B*C
BMulA= B*A
load pima.txt
min(pima,[],1)
max(pima, [],1)
mean(pima,1)
var(pima,1,1) %matrix,wt,dim. Wt=0 for normalization of N, and =1 for normalization with N-1
ind=find(pima(:,9)>0)
pima_ones=pima(ind,:)
ind0=find(pima(:,9)==0)
pima_zeros=pima(ind0,:)
mean(pima_ones,1)
mean(pima_zeros,1)
var(pima_ones,1,1)
var(pima_zeros,1,1)

ind1=find(pima(:,9)>0);
pima_ones=pima(ind1,:);
ind0=find(pima(:,9)==0);
pima_zeros=pima(ind0,:);
meanOnes=mean(pima_ones,1)
meanZeros=mean(pima_zeros,1)
sdOnes=realsqrt(var(pima_ones,1,1))
sdZeros=realsqrt(var(pima_zeros,1,1))
% diabetes padegree function because there means are more than 2 sd apart from their variance. 
% 
c=corrcoef(pima);
c(1:8,9)
% 1st and 8th variables, ie, no of pregnancies and age is highly
% correlated(.544)
histogram(pima(:,7),20)
histogram(pima(:,1),20)
histogram(pima(:,2),20)
histogram(pima(:,3),20)
histogram(pima(:,4),20)
histogram(pima(:,5),20)
histogram(pima(:,6),20)
histogram(pima(:,7),20)
histogram(pima(:,8),20)
histogram(pima(:,9),20)



histogram_analysis(pima(:,1))
histogram_analysis(pima(:,2))
histogram_analysis(pima(:,3))
histogram_analysis(pima(:,4))
histogram_analysis(pima(:,5))
histogram_analysis(pima(:,6))
histogram_analysis(pima(:,7))
histogram_analysis(pima(:,8))
histogram_analysis(pima(:,9))



subplot(2,4,1)
histogram_analysis(pima_zeros(:,1))
hold on
histogram_analysis(pima_ones(:,1))
hold off
subplot(2,4,2)
histogram_analysis(pima_zeros(:,2))
hold on
histogram_analysis(pima_ones(:,2))
hold off
subplot(2,4,3)
histogram_analysis(pima_zeros(:,3))
hold on
histogram_analysis(pima_ones(:,3))
hold off
subplot(2,4,4)
histogram_analysis(pima_zeros(:,4))
hold on
histogram_analysis(pima_ones(:,4))
hold off
subplot(2,4,5)
histogram_analysis(pima_zeros(:,5))
hold on
histogram_analysis(pima_ones(:,5))
hold off
subplot(2,4,6)
histogram_analysis(pima_zeros(:,6))
hold on
histogram_analysis(pima_ones(:,6))
hold off
subplot(2,4,7)
histogram_analysis(pima_zeros(:,7))
hold on
histogram_analysis(pima_ones(:,7))
hold off
subplot(2,4,8)
histogram_analysis(pima_zeros(:,8))
hold on
histogram_analysis(pima_ones(:,8))
hold off


cat=["red";"black";"yellow";"red";"green";"blue";"blue"]
one_hot(cat)

out=normalize(pima(:,3));
out(1:5,:)

out=discretize_attribute(pima(:,3),10);
out(1:5)

sumTrainLen=0;
sumTestLen=0;
for i=1:20
[train,test]=devideset1(pima,0.66);
sumTrainLen=sumTrainLen+length(train);
sumTestLen=sumTestLen+length(test);
end
avgTrainLen=sumTrainLen/20
avgTestLen=sumTestLen/20

[train2,test2]=devideset2(pima,0.66)
[train2,test2]=devideset2(pima,0.66)

%always give train set of 506 enteries and test set o 250 entries. 