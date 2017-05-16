function [ MI ] = MI_KNN_cont_cat( X,Y,k )
    %X is continuous
    %Y is categorical
 
    %%
    Y_tbl = tabulate(Y);
    Y_freqs = Y_tbl(:,3)*0.01;
    MI = 0;
    N = length(X);
    nlevel = max(Y);
    for i=1:nlevel,
        [~, D] = knnsearch(X,X(Y==i), 'K',k);
       
        f_x_i = k./(2*N.*D(:,k));
        
        N_cond = sum(Y==i);
        [~, D_cond] = knnsearch(X(Y==i),X(Y==i), 'K',k);
        f_y_i_cond = k./(2*N_cond.*D_cond(:,k));
        
        f_y_i = Y_freqs(i);
        MI = MI + f_y_i*mean(log(f_y_i_cond./f_x_i));
    end

    
end

