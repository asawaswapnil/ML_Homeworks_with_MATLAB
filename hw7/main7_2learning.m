load pneumonia.tex
nemo=pneumonia
ml_nemo=mean(nemo)
Oneind=find(nemo(:,5)==1)
Zeroind=find(nemo(:,5)==0)

ml_0nemo=mean(nemo(Zeroind,:))
ml_1nemo=mean(nemo(Oneind,:))


ThethaFever=ml_nemo(1)
ThethaPaleness=ml_nemo(2)
ThethaCough=ml_nemo(3)
ThethaHwbc=ml_nemo(4)
ThethaPheunomia=ml_nemo(5)

Thetha0Fever=ml_0nemo(1)
Thetha0Paleness=ml_0nemo(2)
Thetha0Cough=ml_0nemo(3)
Thetha0Hwbc=ml_0nemo(4)
Thetha0Pheunomia=ml_0nemo(5)
Thetha1Fever=ml_1nemo(1)
Thetha1Paleness=ml_1nemo(2)
Thetha1Cough=ml_1nemo(3)
Thetha1Hwbc=ml_1nemo(4)
Thetha1Pheunomia=ml_1nemo(5)