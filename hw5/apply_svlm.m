function y =apply_svml(x,w,b)
s=size(x);
y=zeros(s(1),1);

for i=1:s(1)
    if x(i,:)*w+b>=0
        y(i)=1;
    else 
       y(i)=0;
    end
end
