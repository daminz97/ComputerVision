function [inliers, transf] = ransac(matches, c1, c2)
% This code is part of:
%
%   CMPSCI 370: Computer Vision, Spring 2018
%   University of Massachusetts, Amherst
%   Instructor: Subhransu Maji
%
%   Homework 4
matches = find(matches>0);
[num,d] = size(matches);
max_count = 0;
max_transf = [];
inlier_list = [];

for i=1:1000
    inlier_count = 0;

    a = randi([1 num],1);
    b = randi([1 num],1);
    while a==b
        b = randi([1 num],1);
    end
    
    c1x = c1(1,a);
    c1y = c1(2,a);
    c1xp = c2(1,matches(a));
    c1yp = c2(2,matches(a));

    c2x = c1(1,b);
    c2y = c1(2,b);
    c2xp = c2(1,matches(b));
    c2yp = c2(2,matches(b));

    stop = sqrt(((c1xp-c2xp)^2) + ((c1yp-c2yp)^2));
    sbot = sqrt(((c1x-c2x)^2) + ((c1y-c2y)^2));
    s = stop/sbot;
    
    tx = (c1xp-s*c1x);
    ty = (c1yp-s*c1y);
    t = [tx,ty,s];
    
    temp = [];
    for j = 1:num
        x1 = c1(1,j);
        y1 = c1(2,j);
        xp = c2(1,matches(j));
        yp = c2(2,matches(j));
        match_x = (xp-tx)/s;
        match_y = (yp-ty)/s;
        tof = (((x1-match_x)^2) + ((y1-match_y)^2));
        if tof < 5
            temp = [temp;j];
            inlier_count = inlier_count+1;
        end
    end
    
    if inlier_count > max_count
        max_count = inlier_count;
        max_transf = t;
        inlier_list = temp;
    end
end

display(tx);
display(ty);
display(s);
inliers = inlier_list;
transf = max_transf;







