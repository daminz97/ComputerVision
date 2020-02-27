function score = scoreFeatures(x,y)
%level 1
highest = 0;
coorx = 0;
coory = 0;
score = zeros(28,28);
highest0 = 0;
highest1 = 0;
value30 = 0;
value31 = 0;
value80 = 0;
value81 = 0;

for i=1:28
    for j=1:28
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
            highest0 = value80;
        else
            highest0 = value30;
        end

        if (value31-value81)<0
            highest1 = value81;
        else
            highest1 = value31;
        end
        score(i,j) = highest0+highest1;
        value30 = 0;
        value80 = 0;
        value31 = 0;
        value81 = 0;
    end
end
        
        
        
for m=1:28
    for n=1:28
        if score(m,n) > highest
            highest = score(m,n);
            coorx = m;
            coory = n;
        end
    end
end


if x(coorx,coory) == 1 || x(coorx,coory) == 0
    for k=1:200
        if x(coorx,coory,1,k) == 1 && y(k) == 3
            value31 = value31 + 1;
        elseif x(coorx,coory,1,k) == 1 && y(k)==8
            value81 = value81 + 1;
        end
    end

    for k=1:200
        if x(coorx,coory,1,k) == 0 && y(k) == 3
            value30 = value30 + 1;
        elseif x(coorx,coory,1,k) == 0 && y(k) == 8
            value80 = value80 + 1;
        end
    end
end

if value31 > value81
    disp(3);
else
    disp(8);
end

if value30 > value80
    disp(3);
else
    disp(8);
end

disp((value81+value30)/200);
    


disp(highest);
disp(coorx);
disp(coory);
imagesc(score);
colormap gray;
axis image;
end

