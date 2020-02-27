
function R = calcR(F1, F2, F3, Sr, Sg, Sb)

[R1r, R1g, R1b, R2r, R2g, R2b, R3r, R3g, R3b] = deal(0);

for i=1:10
    R1r = R1r + F1(i)*Sr(i);
    R1g = R1g + F1(i)*Sg(i);
    R1b = R1b + F1(i)*Sb(i);
    R2r = R2r + F2(i)*Sr(i);
    R2g = R2g + F2(i)*Sg(i);
    R2b = R2b + F2(i)*Sb(i);
    R3r = R3r + F3(i)*Sr(i);
    R3g = R3g + F3(i)*Sg(i);
    R3b = R3b + F3(i)*Sb(i);
end

R = [R1r R2r R3r;R1g R2g R3g;R1b R2b R3b];
disp('R is:');
disp(R);
end

