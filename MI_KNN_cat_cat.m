function [ MI ] = MI_KNN_cat_cat( X,Y )
%MI_KNN_cat_cat - Estimates MI between two categorical variables.  Does not
%actually use KNN.
%%
%Start from 1
X = X - min(X) +1;
Y = Y - min(Y) +1;

N = length(X);
X_tbl = tabulate(X); X_freq = X_tbl(:,3)*0.01;
Y_tbl = tabulate(Y); Y_freq = Y_tbl(:,3)*0.01;
XY_freq = crosstab(X,Y)/N;



%%
MI = 0;
%%There are ways to vectorize this very nicely, but for clarity, I am making it into a loop

for i=1:max(X),
    for j=1:max(Y),
        if ( XY_freq(i,j) >0.0001) 
            MI = MI + sum(XY_freq(i,j)*log( XY_freq(i,j)/(X_freq(i)* Y_freq(j))));
        end
    end
end


end

