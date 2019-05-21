function auc=AUROC_score(x,y)
 [xauc,yauc,t,auc]=perfcurve(y,x,1)
end