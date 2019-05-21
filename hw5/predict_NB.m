function [target_class] = predict_NB(probability_0, probability_1)
g0 = log(probability_0);
g1 = log(probability_1);
target_class = double(g1>g0);
end