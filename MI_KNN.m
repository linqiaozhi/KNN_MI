function [ MI ] = MI_KNN( X,Y,k )
% MI_KNN - Find the mutual information between X and Y using a K-nearest
% neighbor estimator

%%%%%%%%%%%%%%%%%%%%
% Find the distance to kth nearest neighbor in the L_infinity distance (aka
% Chebyshev distance
%%%%%%%%%%%%%%%%%%%%
N = length(X);
Z = [ X Y ];
[~, zdist] = knnsearch(Z,Z,'dist', 'chebychev', 'k', k, 'NSMethod', 'kdtree');
znearest = zdist(:,k);

%%%%%%%%%%%%%%%%%%%%
% Count the number of points whose X and Y distances are strictly less
% than zdist(i,k). 
%%%%%%%%%%%%%%%%%%%%
Nx = getnx(X,znearest);
Ny = getnx(Y,znearest);


%%%%%%%%%%%%%%%%%%%%
% Equation 8 from Kraskov et al. 2004
%%%%%%%%%%%%%%%%%%%%
avg = mean(psi(Nx+1) + psi(Ny+1));
MI = psi(k-1) + psi(N) - avg;

end

