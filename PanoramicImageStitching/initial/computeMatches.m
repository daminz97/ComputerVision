function m = computeMatches(f1,f2)
% This code is part of:
%
%   CMPSCI 370: Computer Vision, Spring 2018
%   University of Massachusetts, Amherst
%   Instructor: Subhransu Maji
%
%   Homework 4
[d,N] = size(f1);
[d,M] = size(f2);
m = zeros(N,1);

for i = 1:N
    diff = zeros(M,1);
    for j=1:M
        ssd = sum((f2(:,j)-f1(:,i)).^2);
        diff(j) = ssd;
    end
    min = diff(1);
    index = 1;
    for a = 1:M  
        if diff(a)<min
            min = diff(a);
            index = a;
        end
    end
    diff = sort(diff,'ascend');
    ratio = min/diff(2);
    if ratio<0.8
        m(i) = index;
    else
        m(i) = 0;
    end
end