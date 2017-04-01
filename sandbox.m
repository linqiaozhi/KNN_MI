%%%%%%%%%%%%%%%%%
%% Construct X, Y with pre-specified correlation
%%%%%%%%%%%%%%%%%
mu = 0;
sigma = 1;
N = 30E3;
M = mu + sigma*randn(N,2);
R = [1 0.75; 0.75 1];
%R = [1 0; 0 1];
L = chol(R);
M = M*L;
X = M(:,1);
Y = M(:,2);
r = corr(X,Y);
MI_ = -0.5*log(1-r^2);
Z = [ X Y ];
%%
tic
MI = MI_KNN(X,Y,2);
toc

disp(sprintf('True MI: %.4f, KNN based MI: %.4f', MI_, MI))