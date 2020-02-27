function secondlayer(coorx,coory,x,y)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

highest1 = 0;
highest2 = 0;
coorx1 = 0;
coory1 = 0;
coorx2 = 0;
coory2 = 0;
score1 = zeros(28,28);
score2 = zeros(28,28);
highest10 = 0;
highest11 = 0;
highest20 = 0;
highest21 = 0;
value30 = 0;
value31 = 0;
value80 = 0;
value81 = 0;


for i=1:28
    for j=1:28
        if x(i,j)==1
            for k=1:200
                if x(i,j,1,k) == 0 && y(k) == 3
                    value30 = value30 + 1;
                elseif x(i,j,1,k) == 0 && y(k) == 8
                    value80 = value80 + 1;
                elseif x(i,j,1,k) == 1 && y(k) == 3
                    value31 = value31 + 1;
                else
                    value81 = value81 + 1;
                end
            end
        
            if (value30-value80)<0
                highest10 = value80;
            else
                highest10 = value30;
            end

            if (value31-value81)<0
                highest11 = value81;
            else
                highest11 = value31;
            end
            score1(i,j) = highest10+highest11;
            value30 = 0;
            value80 = 0;
            value31 = 0;
            value81 = 0;
        else
            for k=1:200
                if x(i,j,1,k) == 0 && y(k) == 3
                    value30 = value30 + 1;
                elseif x(i,j,1,k) == 0 && y(k) == 8
                    value80 = value80 + 1;
                elseif x(i,j,1,k) == 1 && y(k) == 3
                    value31 = value31 + 1;
                else
                    value81 = value81 + 1;
                end
            end
        
            if (value30-value80)<0
                highest20 = value80;
            else
                highest20 = value30;
            end

            if (value31-value81)<0
                highest21 = value81;
            else
                highest21 = value31;
            end
            score2(i,j) = highest20+highest21;
            value30 = 0;
            value80 = 0;
            value31 = 0;
            value81 = 0;
        end
    end
end

[sizem,sizen] = size(score1);
for m=1:sizem
    for n=1:sizen
        if score1(m,n) > highest1 && score1(m,n)~=157
            highest1 = score1(m,n);
            coorx1 = m;
            coory1 = n;
        end
    end
end

[sizea,sizeb] = size(score2);
for a=1:sizea
    for b=1:sizeb
        if score2(a,b) > highest2 && score2(a,b)~=172
            highest2 = score2(a,b);
            coorx2 = a;
            coory2 = b;
        end
    end
end





if x(coorx1,coory1) == 1 || x(coorx1,coory1) == 0
    for k=1:200
        if x(coorx1,coory1,1,k) == 1 && y(k) == 3
            value31 = value31 + 1;
        elseif x(coorx1,coory1,1,k) == 1 && y(k)==8
            value81 = value81 + 1;
        end
    end
else
    for k=1:200
        if x(coorx1,coory1,1,k) == 0 && y(k) == 3
            value30 = value30 + 1;
        elseif x(coorx1,coory1,1,k) == 0 && y(k) == 8
            value80 = value80 + 1;
        end
    end
end

if value31 > value81 && value31~=0 && value81~=0
    disp(3);
elseif value31 < value81 && value31~=0 && value81~=0
    disp(8);
else
    disp(0);
end

if value30 > value80 && value30~=0 && value80~=0
    disp(3);
elseif value30 < value80 && value30~=0 && value80~=0
    disp(8);
else
    disp(0);
end

disp((value81+value30)/200);

value30=0;
value31=0;
value80=0;
value81=0;


if x(coorx2,coory2) == 1 || x(coorx2,coory2) == 0
    for k=1:200
        if x(coorx2,coory2,1,k) == 1 && y(k) == 3
            value31 = value31 + 1;
        elseif x(coorx2,coory2,1,k) == 1 && y(k)==8
            value81 = value81 + 1;
        end
    end
else
    for k=1:200
        if x(coorx2,coory2,1,k) == 0 && y(k) == 3
            value30 = value30 + 1;
        elseif x(coorx2,coory2,1,k) == 0 && y(k) == 8
            value80 = value80 + 1;
        end
    end
end

if value31 > value81 && value31~=0 && value81~=0
    disp(3);
elseif value31 < value81 && value31~=0 && value81~=0
    disp(8);
else
    disp(0);
end

if value30 > value80 && value30~=0 && value80~=0
    disp(3);
elseif value30 < value80 && value30~=0 && value80~=0
    disp(8);
else
    disp(0);
end

disp((value81+value30)/200);



disp(highest1);
disp(coorx1);
disp(coory1);
imagesc(score1);
colormap gray;
axis image;
                    

end

