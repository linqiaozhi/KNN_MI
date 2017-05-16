# KNN_MI
Alpha version of Matlab implementation of estimators of mutual information between two variables X and Y.  

* X and Y both continuous: Kraskov et al. 2015 K-nearest
neighbor estimator for mutual information.  These codes implement Equation 8
from the paper.
* X is continuous and Y is categorical: KNN plugin estimator for MI
* X is categorical and Y is categorical: histogram plugin estimator for MI.  Does not actually use KNN, but is included for convenience.

Please note these codes are under development and have not been thoroughly tested.

* MI_KNN_cont_cont.m: Calculate mutual information of two continuous variables
* MI_KNN_cont_cat.m: Calculate mutual information of categorical and continuous variables
* MI_KNN_cat_cat.m: Calculate mutual information of categorical and categorical variables
* sandbox.m: Test cases for each of the above 
* getnx.m: Helper function for MI_KNN_cont_cont.m


## References
Estimating mutual information. Alexander Kraskov, Harald Stögbauer, and Peter Grassberger. Phys. Rev. E 69, 066138 – Published 23 June 2004
