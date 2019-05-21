load clustering_data.txt
data=clustering_data

[clusters3,centers3]=kmeans(data,3);
color=['r'; 'g';'b'];
for i=1:size(centers3,1)
     scatter(data(find(clusters3==i),1), data(find(clusters3==i),2),color(i,1), 'filled');
     hold on;
     s=size(find(clusters3==i))

     scatter(centers3(i,1),centers3(i,2),'k', 'filled')
     hold on;
 end
 hold off;
 
 
 
 
% [clusters4,centers4,sums]=kmeans(data,4  )
% color=['r'; 'g';'b';'c'];

% [clusters4,centers4]=kmeans(data,4);
% 
% for i=1:size(centers4,1)
%      scatter(data(find(clusters4==i),1), data(find(clusters4==i),2),color(i,1), 'filled');
%      hold on;
%      s=size(find(clusters4==i))
% 
%      scatter(centers4(i,1),centers4(i,2),'k', 'filled')
%      hold on;
%  end
%  hold off;
% 
% clusters4m=zeros(2,size(clusters4,1),size(clusters4,1))
% % clusters4m=zeros(30,size(data))
% centers4m=zeros(2,size(centers4,1),size(centers4,1))

color=['r'; 'g';'b';'c'];

[a1,c1]=kmeans(data,4);
for i=1:size(c1,1)
     scatter(data(find(a1==i),1), data(find(a1==i),2),color(i,1), 'filled');
     hold on;
     s=size(find(a1==i))

     scatter(c1(i,1),c1(i,2),'k', 'filled')
     hold on;
 end
 hold off;

[a2,c2]=kmeans(data,4);
s=zeros(4,1)
for i=1:size(c2,1)
     scatter(data(find(a2==i),1), data(find(a2==i),2),color(i,1), 'filled');
     hold on;
     s=size(find(a2==i))
     scatter(c2(i,1),c2(i,2),'k', 'filled')
     hold on;
end
 
 hold off;

clusters4m=[a1;a2]
centers4m= [c1;c2]

% [clusters4m(1,:,:),centers4m(1,:,:)]=kmeans(data,4);[a1,c1]=kmeans(data,4);
% [a2,c2]=kmeans(data,4);
% clusters4m=()
% centers4m= [c1;c2]
% % 
% [clusters4m(2,:,:),centers4m(2,:,:)]=kmeans(data,4);
best_cluster(clusters4m,centers4m,2)
% %  
% best_cluster(clusters4m,centers4m)
%  
% clusters4m=zeros(2,size(clusters4,1),size(clusters4,1))
% % clusters4m=zeros(30,size(data))
% centers4m=zeros(2,size(centers4,1),size(centers4,1))
% 
% [clusters4m,centers4m]=kmeans(data,4);
% [clusters4m{2},centers4m{2}]=kmeans(data,4);
% best_cluster(clusters4m,centers4m)
%  
[a30,c30]=kmeans(data,4);

for i=2:30
     [a,c]=kmeans(data,4);
     c30=[c30;c]
     a30=[a30;a]
end
ibest=best_cluster(a30,c30,30)

