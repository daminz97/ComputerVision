function [im, predShift] = alignChannels(im, maxShift)
% Implement this
im = im;
predShift = zeros(2,2);

assert(size(im,3) == 3);

red = im(:,:,1);
green = im(:,:,2);
blue = im(:,:,3);

minG = Inf;
minB = Inf;

ShiftG = zeros(2);
ShiftB = zeros(2);

for i = (-maxShift(1):maxShift(1))
    for j = (-maxShift(2):maxShift(2))
        imG = circshift(green, [i j])-red;
        DiffG = sum(sum(abs(imG)));
        if DiffG < minG
            minG = DiffG;
            ShiftG = [i,j];
        end
    end
end
predShift(1,:)=ShiftG;

for i = (-maxShift(1):maxShift(1))
    for j = (-maxShift(2):maxShift(2))
        imB = circshift(blue, [i j])-red;
        DiffB = sum(sum(abs(imB)));
        if DiffB < minB
            minB = DiffB;
            ShiftB = [i,j];
        end
    end
end
predShift(2,:)=ShiftB;

ngreen = circshift(green, predShift(1,:));
nblue = circshift(blue, predShift(2,:));
im = cat(3,red,ngreen,nblue);
