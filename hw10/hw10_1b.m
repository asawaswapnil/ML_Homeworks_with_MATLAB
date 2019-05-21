load FeatureSelectionData.txt;
feat=FeatureSelectionData;
ascores=zeros(70,1);
for i=1:70
    ascores(i,1)=AUROC_score(feat(:,i),feat(:,71));
    if(ascores(i,1)<0.5)
         ascores(i,1)=1- ascores(i,1);
    end
end
[asval,asind]=sort(ascores, 'descend')
    
aoutsval=asval(1:20,1);
aoutsind=asind(1:20,1);
aout=[aoutsind,aoutsval]

[aoutsortagain,aoutsortindagain]=sort(aoutsind);
aoutsortvalagain= outsval(aoutsortindagain,1);
aoutagain=[aoutsortagain,aoutsortvalagain]

% [xauclr,yauclr,t,auclr] = perfcurve(feat(:,71),feat(:,1),0)
