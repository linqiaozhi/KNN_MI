# KNN_MI
Alpha version of Matlab implementation of the Kraskov et al. 2015 K-nearest
neighbor estimator for mutual information.  These codes implement Equation 8
from the paper.

Please note these codes are under development and have not been thoroughly tested.

* MI_KNN.m: Function to calculate mutual information of two variables
* getnx.m: Helper function
* sandbox.m: Test case using two Gaussians


## TODO
* Need to optimize getnx.m
* Implement distance measures that will work for categorical variables
