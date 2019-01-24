%   This funciton is to compute the covariance of two images
%   It requires three parameters: two input images and filter window radius
%   Author: Dan Huang

function cov_IP = covariance(I,p,r)
%Compute local mean of two images by calling function localMean()
mean_I=localMean(I,r);
mean_P=localMean(p,r);

%Compute correlation of two images
corr_IP=localMean(I.*p,r);

%Compute covariance
cov_IP=corr_IP-mean_I.*mean_P;
end