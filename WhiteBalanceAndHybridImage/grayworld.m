
function [L, C] = grayworld(I)
    avg = mean(reshape(I, size(I,1) * size(I,2), size(I,3)));
    
    L = avg/128;
    
    im = zeros(size(I,1),size(I,2),3);
    im(:,:,1) = I(:,:,1)*1/L(1);
    im(:,:,2) = I(:,:,2)*1/L(2);
    im(:,:,3) = I(:,:,3)*1/L(3);
    
    im = uint8(im);
    imagesc(im);
    
    
    ravg = mean(mean(I(:,:,1)));
    gavg = mean(mean(I(:,:,2)));
    bavg = mean(mean(I(:,:,3)));
    
    R = ravg/128;
    G = gavg/128;
    B = bavg/128;
    
    L=[R G B];
    C = im;
end
    