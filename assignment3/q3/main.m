clear; close all; clc

[X, y, theta_true] = load_data;

%lambda = 0.001;
lambda = 1;
%lambda = 10;

l1ls(X, y, lambda);