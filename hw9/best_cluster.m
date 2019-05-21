function argmin =best_cluster(clusarr,cenarr,bs)

%bs=2
nc=4
dist=zeros(bs,1);
s=zeros(bs,4)

load clustering_data.txt;
data=clustering_data;
 for j=1:bs
     dist(j)=0;
     clus=clusarr((j-1)*200+1:j*200,:)
     cen=cenarr((j-1)*nc+1:j*nc, :)
    for i=1:nc
        x=sum((data(find(clus==i),1)-cen(i,1)).^2+((data(find(clus==i),2)-cen(i,2)).^2));
         dist(j,1)=dist(j,1)+x
         s(j,i)=size(find(clus==i),1);
    end
 end
 s;
 [argvalue, argmin] = min(dist);
 j=argmin;
 clus=clusarr((j-1)*200+1:j*200,:)
 cen=cenarr((j-1)*nc+1:j*nc, :)
 color=['r'; 'g';'b';'c'];

for i=1:nc
     scatter(data(find(clus==i),1), data(find(clus==i),2),color(i,1), 'filled');
     hold on;
     sb=size(find(clus==i));
     scatter(cen(i,1),cen(i,2),'k', 'filled');
     hold on;
end
 hold off;
