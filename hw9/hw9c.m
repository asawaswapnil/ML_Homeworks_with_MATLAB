load clustering_data.txt;
Y=clustering_data;
Z = linkage(Y,'complete','euclidean');
dendrogram(Z,0);
C = cluster(Z,'maxclust',4)
mh=zeros(4,2)
for i=1:4
     scatter(data(find(C==i),1), data(find(C==i),2),color(i,1), 'filled');
     hold on;
     s=size(find(C==i))
      scatter(mh(i,1),mh(i,2))
      hold on;
     
end
 hold off;
 best_cluster(C,mh,1)
 