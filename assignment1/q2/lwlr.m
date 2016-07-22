function y = lwlr(X_train, y_train, x, tau)

%%% YOUR CODE HERE
m = size(X_train, 1);
n = size(X_train, 2);
lamda = 0.0001;
theta = zeros(n, 1);

% 1) compute weights w(i) for each training example
w = exp(-sum((X_train - repmat(x',m,1)) .^ 2, 2) / (2 * tau ^ 2));

% 2) maximize l(¦È)
g = ones(n, 1);
while (norm(g) > 1e-6)
    h = 1 ./ (1 + exp(-X_train * theta));
    g = X_train' * (w .* (y_train - h)) - lamda * theta;
    H = X_train' * diag(-w .* h .* (1 - h)) * X_train - lamda * eye(n);
    theta = theta - H \ g
end

% 3) output y = 1{h¦È(x) > 0.5} as the prediction
p = 1 ./ (1 + exp(-x' * theta));
y = double(p > 0.5);