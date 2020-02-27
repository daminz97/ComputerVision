function im = hybridImage(im1, im2, sigma1, sigma2)
    f1 = fspecial('gaussian', 6*sigma1+1, sigma1);
    f2 = fspecial('gaussian', 6*sigma2+1, sigma2);
    
    im1b = filter2rgb(im1, f1);
    im2b = filter2rgb(im2, f2);

    im = im1b+(im2-im2b);
    imagesc(im);