function [ MI ] = MI_KNN_cont_cat( X,Y,k )
% MI_KNN_cat_cat - Estimates MI between continuous variable X and
% categorical variable Y.  Y should be a vector of integers starting from
% 1.

%Start from 1
Y = Y - min(Y) +1;

Y_tbl = tabulate(Y);
Y_freqs = Y_tbl(:,3)*0.01;
MI = 0;
N = length(X);
nlevel = max(Y);
for i=1:nlevel,
    [~, D] = knnsearch(X,X(Y==i), 'K',k);
    
    f_x_i = k./(2*N.*D(:,k));
    
    N_cond = sum(Y==i);
    if (N_cond/2 < k),
        fprintf('Error: The number of elements with Y= %d is %d, which is less than 2*k.  Skipping this one...', i, N_cond);
        MI = 0;
        return;
    end
    [~, D_cond] = knnsearch(X(Y==i),X(Y==i), 'K',k);
    f_y_i_cond = k./(2*N_cond.*D_cond(:,k));
    
    f_y_i = Y_freqs(i);
    MI = MI + f_y_i*mean(log(f_y_i_cond./f_x_i));
end

MI = max(MI, 0);

end

