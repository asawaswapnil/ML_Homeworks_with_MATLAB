function W=ogd(train)
W=zeros(1,13);
n=length(train);
for i=1:129
    ind=i;
    if(i>n)
        ind=mod(i,n)+1;
    end
    %i
    %W
    inst=train(ind,:);
    xi=inst(:,1:13);
    yi=inst(:,14);
    Wt=transpose(W);
    yiCap=xi*Wt;
    gap=yi-yiCap;
    alpha=0.05/i;
    %alpha*(gap)*xi
    W=W+alpha*(gap)*xi;
end
    
