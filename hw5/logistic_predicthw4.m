function [y]=logistic_predict(X,w)

col_ones = ones(size(X, 1), 1)
X = horzcat(col_ones, X);

for i=1:length(X)
    linear=w'*X(i,:)'; % TO make it so the resultant is a 1x1 scaler
    exp_mat=1+exp(-(linear));
    y(i) = 1/exp_mat;
end

end
