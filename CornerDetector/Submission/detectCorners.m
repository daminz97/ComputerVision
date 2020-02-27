function [cx, cy, cs] = detectCorners(I, isSimple, w, th)
% This code is part of:
%
%   CMPSCI 370: Computer Vision, Spring 2016
%   University of Massachusetts, Amherst
%   Instructor: Subhransu Maji
%
%   Homework 3

% Convert to double format
I = im2double(I); 

% Convert color to grayscale
if size(I, 3) > 1 
    I = rgb2gray(I);
end

% Step 1: Compute corner score
if isSimple
    cornerScore = simpleScore(I, w);
else
    cornerScore = harrisScore(I, w);
end

% Step 2: Threshold corner score abd find peaks
cornerScore (cornerScore < th) = 0;
[cx, cy, cs] = nms(cornerScore);


%--------------------------------------------------------------------------
%                                    Simple score function (Implement this)
%--------------------------------------------------------------------------
function cornerScore = simpleScore(I, w)
    cornerScore = zeros(size(I));
    for u = -1:1
        for v = -1:1
            if u==-1 && v==-1
                f = [1 0 0;0 -1 0;0 0 0];
            elseif u==-1 && v==0
                f = [0 0 0;1 -1 0;0 0 0];
            elseif u==-1 && v==1
                f = [0 0 0;0 -1 0;1 0 0];
            elseif u==0 && v==-1
                f = [0 1 0;0 -1 0;0 0 0];
            elseif u==0 && v==0
                f = [0 0 0;0 -1 0;0 0 0];
            elseif u==0 && v==1
                f = [0 0 0;0 -1 0;0 1 0];
            elseif u==1 && v==-1
                f = [0 0 1;0 -1 0;0 0 0];
            elseif u==1 && v==0
                f = [0 0 0;0 -1 1;0 0 0];
            elseif u==1 && v==1
                f = [0 0 0;0 -1 0;0 0 1];
            end

            imdiff = imfilter(I,f,'replicate');
            g = fspecial('gaussian',6*w+1,w);
            e = imfilter(imdiff.^2,g,'same');
            cornerScore = cornerScore + e;
        end
    end


%--------------------------------------------------------------------------
%                                    Harris score function (Implement this)
%--------------------------------------------------------------------------
function cornerScore= harrisScore(I, w)
    k = 0.04;
    g = fspecial('gaussian', 6*w+1, w);
    dx = [-1 0 1; -1 0 1; -1 0 1]; 
    dy = dx';

    Ix = imfilter(I, dx,'replicate');    
    Ixx = Ix.^2;
    Iy = imfilter(I, dy,'replicate');  
    Iyy = Iy.^2;
    Ixy = Ix.*Iy;

    Gxx = conv2(Ixx, g,'same');
    Gyy = conv2(Iyy, g,'same');
    Gxy = conv2(Ixy, g,'same');

    cornerScore = (Gxx.*Gyy-Gxy.^2)-k*(Gxx+Gyy).^2;

    
    
    
    
    
    
    
    
    
    
    
    
    
    
    