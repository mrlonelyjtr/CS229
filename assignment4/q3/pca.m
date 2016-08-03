function U = pca(X)

%%% YOUR CODE HERE
m = size(X, 2);

[U, S, V] = svd(1 / m * (X * X'));