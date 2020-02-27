function mosim = mosaicImage(im)
% MOSAICIMAGE computes the mosaic of an image.
%   MOSIM = MOSAICIMAGE(IM) computes the response of the image under a
%   Bayer filter. Given an image IM = NxMx3, the output is a NxM image
%   where the R,G,B channels are sampled according to RGRG on the top left.
%
% This code is part of:
%
%   CMPSCI 370: Computer Vision, Fall 2014
%   University of Massachusetts, Amherst
%   Instructor: Subhransu Maji
%
%   Homework 1: Color images

[imageHeight, imageWidth, numChanels] = size(im);
assert(numChanels == 3); % Check that it is a color image
mosim = im;

mosim = zeros(imageHeight,imageWidth);

for i = 1:imageHeight
    for j = 1:imageWidth
        if rem(i,2)~=0
            if rem(j,2)~=0
                mosim(i,j)=im(i,j,1);
            else
                mosim(i,j)=im(i,j,2);
            end
        else
            if rem(j,2)==0
                mosim(i,j)=im(i,j,3);
            else
                mosim(i,j)=im(i,j,2);
            end
        end
    end
end

            

