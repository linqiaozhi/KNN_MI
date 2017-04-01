function [ Nx ] = getnx( X,znearest )
% GETNX Count the number of points whose X distance are strictly less
% than znearest(i).
N = length(X);
[Xs,si] = sort(X);
xdiff = diff(Xs);
rxs = znearest(si);
Nx = zeros(N,1);

for i=1:N
    currdiff = 0;
    for j=(i):(N-1)
        currdiff = currdiff + xdiff(j);
        if (currdiff < rxs(i))
            Nx(i) = Nx(i)+1;
        else
            break;
        end
    end
    currdiff = 0;
    for j=(i-1):-1:2
        currdiff = currdiff + xdiff(j);
        if (currdiff < rxs(i))
            Nx(i) = Nx(i)+1;
        else
            break;
        end
    end
end


end

