load FeatureSelectionData.txt;
feat=FeatureSelectionData;
scores=zeros(70,1);
for i=1:70
    scores(i,1)=Fisher_score(feat(:,i),feat(:,71));
end
[sval,sind]=sort(scores, 'descend');
    
outsval=sval(1:20,1);
outsind=sind(1:20,1);
out=[outsind,outsval]

[outsortagain,outsortindagain]=sort(outsind);
outsortvalagain= outsval(outsortindagain,1);
outagain=[outsortagain,outsortvalagain]
    