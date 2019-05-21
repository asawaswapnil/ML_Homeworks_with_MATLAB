
load hw10_train.txt;
load hw10_test.txt;
tr_x= hw10_train(:,1:65);
tr_y= hw10_train(:,66)
test_x= hw10_test(:,1:65);
test_orig_y= hw10_test(:,66);
test_y_bag=zeros(size(test_x,1),10)
test_y_boost=zeros(size(test_x,1),10)
error_bag=zeros(20,10)
error_boost=zeros(20,10)
error_bagavg=zeros(1,10)
error_boostavg=zeros(1,10)
%bagging
 [test_y_5bag] = Bag_classifier(tr_x,tr_y,test_x,['[@DT_base_full,',num2str(5),',[]]']);
[test_y_base] = Bag_classifier(tr_x,tr_y,test_x,'[@DT_base_full,1,[]]');
Error_5=sum(abs(test_y_5bag-test_orig_y))/size(test_x,1)
Error_base=sum(abs(test_y_base-test_orig_y))/size(test_x,1)

%bagging
for i=1:10
    for j=1:20
        [test_y_bag(:,i)] = Bag_classifier(tr_x,tr_y,test_x,['[@DT_base_full,',num2str(i),',[]]']);
        error_bag(j,i)=sum(abs(test_y_bag(:,i)-test_orig_y))/size(test_x,1);
    end
    error_bagavg(1,i)=mean(error_bag(:,i))
end

%boosting
for i=1:10
    for j=1:20
        [test_y_boost(:,i)] = Boost_classifier(tr_x,tr_y,test_x,['[@DT_base_full,',num2str(i),',[]]']);
        error_boost(j,i)=sum(abs(test_y_boost(:,i)-test_orig_y))/size(test_x,1);
    end
    error_boostavg(1,i)=mean(error_boost(:,i))
end

scatter(1,Error_base,'k','fill')
    hold on;


for i=2:10
    scatter(i,error_bagavg(1,i),'b','fill')
    hold on;
end
for i=2:10
    scatter(i,error_boostavg(1,i),'r','fill')
    hold on;
end

test_y_bag=zeros(size(tr_x,1),10)
test_y_boost=zeros(size(tr_x,1),10)
error_bag=zeros(20,10)
error_boost=zeros(20,10)
error_bagavg=zeros(1,10)
error_boostavg=zeros(1,10)
%bagging
 [test_y_5bag] = Bag_classifier(tr_x,tr_y,test_x,['[@DT_base_full,',num2str(5),',[]]']);
[test_y_base] = Bag_classifier(tr_x,tr_y,test_x,'[@DT_base_full,1,[]]');
Error_5=sum(abs(test_y_5bag-test_orig_y))/size(test_x,1)
Error_base=sum(abs(test_y_base-test_orig_y))/size(test_x,1)
%bagging
for i=1:10
    for j=1:20
        [test_y_bag(:,i)] = Bag_classifier(tr_x,tr_y,tr_x,['[@DT_base_full,',num2str(i),',[]]']);
        error_bag(j,i)=sum(abs(test_y_bag(:,i)-tr_y))/size(tr_x,1);
    end
    error_bagavg(1,i)=mean(error_bag(:,i))
end

%boosting
for i=1:10
    for j=1:20
        [test_y_boost(:,i)] = Boost_classifier(tr_x,tr_y,tr_x,['[@DT_base_full,',num2str(i),',[]]']);
        error_boost(j,i)=sum(abs(test_y_boost(:,i)-tr_y))/size(tr_x,1);
    end
    error_boostavg(1,i)=mean(error_boost(:,i))
end

scatter(1,Error_base,'c','fill')
    hold on;

for i=2:10
    scatter(i,error_bagavg(1,i),'g','fill')
    hold on;
end
for i=2:10
    scatter(i,error_boostavg(1,i),'y','fill')
    hold on;
end
hold off;
        
