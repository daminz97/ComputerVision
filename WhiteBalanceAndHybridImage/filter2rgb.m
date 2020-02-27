
function im = filter2rgb(A, B)
    R = A(:,:,1);
    G = A(:,:,2);
    b = A(:,:,3);
    
    R = filter2(B, R, 'same');
    G = filter2(B, G, 'same');
    b = filter2(B, b, 'same');
    
    im = cat(3,R,G,b);
    imagesc(im);