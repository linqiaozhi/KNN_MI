clear; clc;
%%%%%%%%%%%%%%%%%
%% Continuous vs. Continuous
%%%%%%%%%%%%%%%%%
%Construct X, Y with pre-specified correlation, since the true MI has
%closed form
mu = 0;
sigma = 1;
N = 300E3;
M = mu + sigma*randn(N,2);
R = [1 0.75; 0.75 1];
%R = [1 0; 0 1];
L = chol(R);
M = M*L;
X = M(:,1);
Y = M(:,2);
r = corr(X,Y);
MI_true = -0.5*log(1-r^2);
Z = [ X Y ];


k = 10;
tic
MI = MI_KNN_cont_cont(X,Y,k);
toc

fprintf('True MI: %.4f, KNN based MI: %.4f', MI_true, MI)

%%%%%%%%%%%%%%%%%
%% Categorical vs. Continuous
%%%%%%%%%%%%%%%%%
% Should be zero
N = 30E3; nlevel = 3; k = 100;
Y = randi(nlevel, N, 1);
X = randn(N,1);


MI = MI_KNN_cont_cat(X,Y,k);
entropyX = MI_KNN_cont_cont(X,X,k);
entropyY = MI_KNN_cat_cat(Y,Y);

fprintf('True MI: %0.4f, KNN based MI: %.4f, H(X) = %.4f, H(Y) = %.4f\n', 0, MI, entropyX, entropyY);
%%

N = 5E3; nlevel = 3; k = 2;
Y = randi(nlevel, N, 1);
X = randn(N,1);  X(Y== nlevel) = X(Y==nlevel) + 3;
MI_KNN_cont_cat(X,Y,k)

X(Y== nlevel) = X(Y==nlevel) + 3;

%%
N = 5E3; 
X = randi(5, N, 1);
Y = randi(3, N, 1);
X(Y== 1) = 2;
X(Y== 3) = 1;
MI_KNN_cat_cat(X,X);