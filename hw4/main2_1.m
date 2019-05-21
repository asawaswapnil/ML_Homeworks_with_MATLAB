function [pima_zeros,pima_ones]= main2_1()
load pima.txt
ind1=find(pima(:,9)>0);
pima_ones=pima(ind1,:);
ind0=find(pima(:,9)==0);
pima_zeros=pima(ind0,:);

for i=1:8
subplot(3,3,i);
histogram_analysis(pima_ones(:,i))
hold on;
histogram_analysis(pima_zeros(:,i))
hold off
xlabel(i);ylabel('Frequency');
end