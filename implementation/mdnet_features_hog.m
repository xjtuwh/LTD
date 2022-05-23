function [ feat ] = mdnet_features_hog(img, boxes, opts)
% MDNET_FEATURES_HOG
% Extract HOG features from bounding box regions of an input image.
%
% Han Wu, 2021
% 

n = size(boxes,1);
ims = mdnet_extract_regions(img, boxes, opts);

for i=1:n
    im = ims(:,:,:,i);
    x = double(fhog(single(im) / 255, 4, 9));
    x(:,:,end) = [];  %remove all-zeros channel ("truncation feature")
    if ~exist('feat','var')
        feat = zeros(size(x,1),size(x,2),size(x,3),n,'single');
    end
    feat(:,:,:,i) = x;
end

