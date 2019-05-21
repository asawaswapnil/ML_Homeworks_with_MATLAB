function W=ogd2(train,W,start,last)
n=length(train);
for i=start:last
    Wt=transpose(W);
    ind=i;
    if(i>n)
        ind=mod(i,n)+1;
    end
    inst=train(ind,:);
    xi=inst(:,1:13);
    yi=inst(:,14);
    yiCap=xi*Wt;
    gap=yi-yiCap;
    dev=int16(i/3000)
    mul=1/double(10^dev)
    alpha=0.05/i*mul;
    W=W+alpha*(gap)*xi;
end
    
