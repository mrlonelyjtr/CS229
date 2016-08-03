clear; close all; clc

[X_ica, X_pca] = load_images;

U = pca(X_pca);
plot_pca_filters(U);
pause;
W = ica(X_ica);
plot_ica_filters(W);