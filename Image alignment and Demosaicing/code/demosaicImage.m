function output = demosaicImage(im, method)
% DEMOSAICIMAGE computes the color image from mosaiced input
%   OUTPUT = DEMOSAICIMAGE(IM, METHOD) computes a demosaiced OUTPUT from
%   the input IM. Various interpolation METHOD can be used such as
%   'baseline', 'nn' 
%
% Author: Subhransu Maji
% Copyright 2014 

switch lower(method)
    case 'baseline'
        output = demosaicBaseline(im);
    case 'nn'
        output = demosaicNN(im);         % Implement this
end

%--------------------------------------------------------------------------
%                          Baseline demosacing algorithm. 
%                          The algorithm replaces missing values with the
%                          mean of each color channel.
%--------------------------------------------------------------------------
function mosim = demosaicBaseline(im)
mosim = repmat(im, [1 1 3]); % Create an image by stacking the input
[imageHeight, imageWidth] = size(im);

% Red channel (odd rows and columns);
redValues = im(1:2:imageHeight, 1:2:imageWidth);
meanValue = mean(mean(redValues));
mosim(:,:,1) = meanValue;
mosim(1:2:imageHeight, 1:2:imageWidth,1) = im(1:2:imageHeight, 1:2:imageWidth);

% Blue channel (even rows and colums);
blueValues = im(2:2:imageHeight, 2:2:imageWidth);
meanValue = mean(mean(blueValues));
mosim(:,:,3) = meanValue;
mosim(2:2:imageHeight, 2:2:imageWidth,3) = im(2:2:imageHeight, 2:2:imageWidth);

% Green channel (remaining places)
% We will first create a mask for the green pixels (+1 green, -1 not green)
mask = ones(imageHeight, imageWidth);
mask(1:2:imageHeight, 1:2:imageWidth) = -1;
mask(2:2:imageHeight, 2:2:imageWidth) = -1;
greenValues = mosim(mask > 0);
meanValue = mean(greenValues);
% For the green pixels we copy the value
greenChannel = im;
greenChannel(mask < 0) = meanValue;
mosim(:,:,2) = greenChannel;

function mosim = demosaicNN(im)
mosim = im;
[imageHeight, imageWidth] = size(im);
red = zeros(imageHeight,imageWidth);
green = zeros(imageHeight,imageWidth);
blue = zeros(imageHeight,imageWidth);

for i = 1:imageHeight
    for j = 1:imageWidth
        if  i<imageHeight && j<imageWidth
            if rem(i,2)~=0 && rem(j,2)~=0
                red(i,j)=im(i,j);
                green(i,j)=im(i+1,j);
                blue(i,j)=im(i+1,j+1);
            elseif rem(i,2)~=0 && rem(j,2)==0
                red(i,j)=im(i,j+1);
                green(i,j)=im(i,j);
                blue(i,j)=im(i+1,j);
            elseif rem(i,2)==0 && rem(j,2)~=0
                red(i,j)=im(i+1,j);
                green(i,j)=im(i,j);
                blue(i,j)=im(i,j+1);
            elseif rem(i,2)==0 && rem(j,2)==0
                red(i,j)=im(i+1,j+1);
                green(i,j)=im(i,j+1);
                blue(i,j)=im(i,j);
            end
        elseif i==imageHeight && j<imageWidth
            if rem(j,2)~=0
                red(i,j)=im(i,j);
                green(i,j)=im(i,j+1);
                blue(i,j)=im(i-1,j+1);
            elseif rem(j,2)==0
                red(i,j)=im(i,j+1);
                green(i,j)=im(i,j);
                blue(i,j)=im(i-1,j);
            end
        elseif j==imageWidth && i<imageHeight
            if rem(i,2)~=0
                red(i,j)=im(i,j);
                green(i,j)=im(i+1,j);
                blue(i,j)=im(i+1,j-1);
            elseif rem(i,2)==0
                red(i,j)=im(i+1,j);
                green(i,j)=im(i,j);
                blue(i,j)=im(i,j-1);
            end
        elseif i==imageHeight && j==imageWidth
            red(i,j)=im(i,j);
            green(i,j)=im(i,j-1);
            blue(i,j)=im(i-1,j-1);
        end
    end
end
mosim = cat(3,red,green,blue);


