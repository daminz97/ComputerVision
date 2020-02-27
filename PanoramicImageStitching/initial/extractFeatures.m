function f = extractFeatures(im, c, patchRadius)
% This code is part of:
%
%   CMPSCI 370: Computer Vision, Spring 2018
%   University of Massachusetts, Amherst
%   Instructor: Subhransu Maji
%
%   Homework 4
if size(im, 3) == 3
    im = rgb2gray(im);
end

D = padarray(im, [patchRadius,patchRadius]);
[r,N] = size(c);
f = zeros((2*patchRadius+1).^2,N);

for i = 1:N
    xmin = c(1,i);
    ymin = c(2,i);
    height = patchRadius*2;
    width = patchRadius*2;
    patch = imcrop(D,[xmin,ymin,width,height]);
    f(:,i) = reshape(patch,[(2*patchRadius+1).^2,1]);
end


