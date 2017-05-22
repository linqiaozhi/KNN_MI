function [ MI ] = MI_KNN_cont_cat( X,Y)
% MI_KNN_cat_cat - Estimates MI between continuous variable X and
% categorical variable Y.  Y should be a vector of integers starting from
% 1.

%Start from 1
Y = Y - min(Y) +1;

Y_tbl = tabulate(Y);
Y_freqs = Y_tbl(:,3)*0.01;

% k = min(k_in, round(min(Y_tbl(:,2))/2) );
% if (k_in ~= k) 
%     fprintf('Warning: Changing K to be %d\n',  k);
% end

MI = 0;
N = length(X);
nlevel = max(Y);
for i=1:nlevel,
    k = round(sqrt(N));
    [~, D] = knnsearch(X,X(Y==i), 'K',k);
    
    f_x_i = k./(2*N.*D(:,k));
    
    N_cond = sum(Y==i);
    k_cond = round(sqrt(N_cond));

    [~, D_cond] = knnsearch(X(Y==i),X(Y==i), 'K',k_cond);
    f_y_i_cond = k_cond./(2*N_cond.*D_cond(:,k_cond));
    
    f_y_i = Y_freqs(i);
    MI = MI + f_y_i*mean(log(f_y_i_cond./f_x_i));
end

MI = max(MI, 0);

end

