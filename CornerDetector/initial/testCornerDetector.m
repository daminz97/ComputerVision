% This code is part of:
%
%   CMPSCI 370: Computer Vision, Spring 2016
%   University of Massachusetts, Amherst
%   Instructor: Subhransu Maji
%
%   Homework 3

% Entry code for corner detector

% Create a checkerboard of size 20 pixels
I = checkerboard(20);
I = imread('polymer-science-umass.jpg');
I = imread('stairs.jpg');

% Simple corners
[cx, cy, cs] = detectCorners(I, true, 1.5, 0.05);
figure;
subplot(1,2,1);
imshow(I); axis image off; hold on;
plot(cx, cy, 'r.');
title('Simple corners');
% Harris corners
[cx, cy, cs] = detectCorners(I, false,1.5, 0.0001);
subplot(1,2,2);
imshow(I); axis image off; hold on;
plot(cx, cy, 'g.');
title('Harris corners');
