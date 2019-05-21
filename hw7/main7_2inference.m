
load pneumonia.tex
load example.txt
nemo=pneumonia
ml_nemo=mean(nemo)
bs=size(example)
out=zeros(bs(1),1)
Na=find(nemo(:,1)==1)
Nb=find(nemo(:,2)==1)
Nc=find(nemo(:,3)==1)
Nd=find(nemo(:,4)==1)
Ny=find(nemo(:,5)==1)
Naay=find(nemo(:,1)==1 & nemo(:,5)==1)
Nbay=find(nemo(:,2)==1 & nemo(:,5)==1)
Ncay=find(nemo(:,3)==1 & nemo(:,5)==1)
Nday=find(nemo(:,4)==1 & nemo(:,5)==1)
Naany=find(nemo(:,1)==1 & nemo(:,5)==0)
Nbany=find(nemo(:,2)==1 & nemo(:,5)==0)
Ncany=find(nemo(:,3)==1 & nemo(:,5)==0)
Ndany=find(nemo(:,4)==1 & nemo(:,5)==0)
Pigy(1)=size(Naay)/size(Ny)
Pigy(2)=size(Nbay)/size(Ny)
Pigy(3)=size(Ncay)/size(Ny)
Pigy(4)=size(Nday)/size(Ny)
Pigny(1)=size(Naany)/(size(pneumonia)-size(Ny))
Pigny(2)=size(Nbany)/(size(pneumonia)-size(Ny))
Pigny(3)=size(Ncany)/(size(pneumonia)-size(Ny))
Pigny(4)=size(Ndany)/(size(pneumonia)-size(Ny))
Py=size(Ny)/size(pneumonia)
for i =1:bs(1)
    mul=1
    din2=1
    for j=1:bs(2)
        if example(i,j)==1
        mul=mul*Pigy(j)
        din2=din2*Pigny(j)
        elseif example(i,j)==0
        mul=mul*(1-Pigy(j))
        din2=din2*(1-Pigny(j))2inference.m
        end
    out(i)=mul*Py/(mul*Py+din2*(1-Py))
    end 
end