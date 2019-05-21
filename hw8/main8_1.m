a=[5,3,3,4,5,4];
load customer_train.txt;
train=customer_train;
%j=class no
%i=attribute
%k=attribute value

%Initialize random thetha
L=size(train,1);
J=4;
I=6;
rng(1);
Pc=     1/J*rand(J,1);
Pxgc=   {1/(a(1))*rand(a(1),J)};
Pxgc{2}=1/(a(2))*rand(a(2),J);
Pxgc{3}=1/(a(3))*rand(a(3),J);
Pxgc{4}=1/(a(4))*rand(a(4),J);
Pxgc{5}=1/(a(5))*rand(a(5),J);
Pxgc{6}=1/(a(6))*rand(a(6),J);
%normalize to make sum P =1
Pc=Pc/sum(Pc);
Pxgc{1}=   Pxgc{1}./sum(Pxgc{1},1);
Pxgc{2}=Pxgc{2}./sum(Pxgc{2},1);
Pxgc{3}=Pxgc{3}./sum(Pxgc{3},1);
Pxgc{4}=Pxgc{4}./sum(Pxgc{4},1);
Pxgc{5}=Pxgc{5}./sum(Pxgc{5},1);
Pxgc{6}=Pxgc{6}./sum(Pxgc{6},1);

%to store the intermidaite paramter values.
% Pcm={Pc};
% Pxgcm={Pxgc};
qplus=0;
qminus=1;
m=0;

%iterations
while (abs(qplus-qminus)>=0.001)
qminus=qplus;
qplus=0;
m=m+1;
% intialize P(c,x/data,thetha)
Pckgd=  {ones(L,a(1),J)};
Pckgd{2}=ones(L,a(2),J);
Pckgd{3}=ones(L,a(3),J);
Pckgd{4}=ones(L,a(4),J);
Pckgd{5}=ones(L,a(5),J);
Pckgd{6}=ones(L,a(6),J);

%intialize expected count of class=j and attribute=k
NPckgd=   {ones(a(1),J)};
NPckgd{2}=ones(a(2),J);
NPckgd{3}=ones(a(3),J);
NPckgd{4}=ones(a(4),J);
NPckgd{5}=ones(a(5),J);
NPckgd{6}=ones(a(6),J);
%intialize expected count of class=j
Ncap=zeros(J,1);
%intialize P of data given c and P of class given data
Pcgd=ones(L,J);
Pdgc=ones(L,J);

%calcuating expected counts

%to calcuate Ncap(C=j)
for l=1:L
    dr=0; % to avoid devision by 0
    for j=1:4
        for i=1:6
            if(train(l,i)~=0)
%                 alpha=train(l,i)
%                  i
%                  j
%                  l
%                  Pxgc{i}(alpha,j)
                Pdgc(l,j)= Pdgc(l,j)*Pxgc{i}(train(l,i),j);
%                 Pdgc(l,:)
            end
        end
        Pcgd(l,j)=Pdgc(l,j)*Pc(j,1); %1D op
        dr=dr+Pcgd(l,j);
    end
    for j=1:4
        Pcgd(l,j)= Pcgd(l,j)./(dr); %1D op
        Ncap(j,1)=Ncap(j,1)+Pcgd(l,j);
    end
    
end

%to calcuate Ncap(C=j,I=k)
for l=1:L
    for j=1:4
        for i=1:6
            for k=1:a(i)
                if(train(l,i)==0)
                    Pckgd{i}(l,k,j)= Pcgd(l,j)*Pxgc{i}(k,j); %1D op
                elseif(train(l,i)==k)
                    Pckgd{i}(l,k,j)= Pcgd(l,j);
                else
                    Pckgd{i}(l,k,j)= 0;
                end
            end
        end
    end
end
for i=1:6
    NPckgd{i}=sum(Pckgd{i},1);
end
    
%maximization
%estimate class prbabilties
for j=1:4
    Pc(j,1)=Ncap(j,1)/sum(Ncap);
end
%estimating P attribute i=k given class k
for j=1:4
    for i=1:6
        for k=1:a(i)
%             NPckgd{i}(1,k,:)
%             sum(NPckgd{i}(1,k,:))
            Pxgc{i}(k,j)=NPckgd{i}(1,k,j)/sum(NPckgd{i}(1,k,:));
            %Pxgc{i}=reshape(Pxgc{i},size(Pxgc{i},2),size(Pxgc{i},3));
        end
    end
end
   
%storing the parameter values of intermidiate steps
% Pcm{m}=Pc;
% Pxgcm{m}=Pxgc;

for i=1:6
   for k=1:a(i)
       for j=1:4
            qplus=qplus+NPckgd{i}(1,k,j)*log(Pxgc{i}(k,j));
       end
   end
end
qplus=qplus+sum(Ncap.*log(Pc));

end

    


