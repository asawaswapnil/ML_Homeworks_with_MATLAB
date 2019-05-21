load FeatureSelectionData.txt;
feat=FeatureSelectionData;
scores=zeros(70,1);
for i=1:70
    ascores(i,1)=AUROC_score(feat(:,i),feat(:,71));
end
[asval,asind]=sort(ascores, 'descend');
    
aoutsval=asval(1:20,1);
aoutsind=asind(1:20,1);

aout=[aoutsind,aoutsval]
[aoutsortagain,aoutsortindagain]=sort(aoutsind);
aoutsortvalagain= aoutsval(aoutsortindagain,1);
aoutagain=[aoutsortagain,aoutsortvalagain]
