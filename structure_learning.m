%% Make some data
clear
p = 20;
rng(2)
sigma_ = sqrt(5)*rand(p,p);
sigma = sigma_'*sigma_;
sigma(sigma<25) = 0;
sigma(eye(p) ==1) = sum(sigma,2);
mu = 5*rand(p,1);
N = 1E3;

X = mvnrnd(mu,sigma,N);

%[~,p] = size(X);
%labels = {'X1', 'X2', 'X3'};
k = 2;
%% Calculate mutual MI
mis = zeros(p,p);

for i=1:p
    for j =(i+1):p
        mis(i,j) = MI_KNN(X(:,i), X(:,j), k);
    end
end
for i=1:p
    for j =1:(i-1)
        mis(i,j) = mis(j,i);
    end
end
mis

%%
close all 
mis(mis < 0.01) = 0;
A = mis;
G  = graph(A)
H = plot(G, 'layout', 'force')
LWidths = 5*G.Edges.Weight/max(G.Edges.Weight);
plot(G,'LineWidth',LWidths)

%labelnode(H, 1:p, labels)