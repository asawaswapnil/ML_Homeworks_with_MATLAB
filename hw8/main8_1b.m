load customer_test.txt
test=customer_test;
Ltest=size(test,1);
Pcgdt=ones(Ltest,4);

%storing P(c/data1-5)
for l=1:Ltest
    for j=1:4
        for i=1:5
            if (test(l,i)~=0)
                Pcgdt(l,j)=Pcgdt(l,j)*Pxgc{i}(test(l,i),j);
            end
        end
        Pcgdt(l,j)=Pcgdt(l,j)*Pc(j);
    end
    for j=1:4
         Pcgdt(l,j)=Pcgdt(l,j)/sum(Pcgdt(l,:)); %1D op
    end            
end
%using P(c/data1-5), calculating P(x6/other data)

Pxgdt=zeros(l,a(6));
for k=1:a(6)
    for l=1:size(test,1)
        for j=1:4
            Pxgdt(l,k)=Pxgdt(l,k)+Pxgc{6}(k,j)*Pcgdt(l,j); %1D op
        end
    end
end
[val,predictions]=max(Pxgdt, [], 2);
Pxgdt;
C2lr= confusionmat(test(:,6),predictions)
sm=0;
for i=1:4
    sm=sm+C2lr(i,i);
end
misclassifcation=(75-sm)/75

        