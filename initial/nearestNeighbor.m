function nearestNeighbor(testset,trainset,trainlabel,k)
    predict = [];
    [length,y,d,s] = size(testset);
    for i=1:length
        neighbors = getNeighbors(testset(i,:), trainset, k, length);
        votes = getVotes(neighbors,trainlabel);
        predict = [predict; votes];
    end
    accuracy = getAccuracy(testset,predict,length);
    disp(accuracy);


    function distance = getDistance(sample1, sample2, length)
        distance = 0;
        for a=1:length
            distance = distance + (sample1(a)-sample2(a)).^2;
        end
        distance = sqrt(distance);
            
    end


    function neighbors = getNeighbors(testinstance, trainset, k,len)
        distance = [];
        for j=1:size(trainset)
            dists = getDistance(testinstance, trainset(j,:), len);
            distance = [distance;{trainset(j,:) dists}];
        end
        distance = sortrows(distance, 2);
        neighbors = [];
        for m=1:k
            neighbors = [neighbors;distance(m,1)];
        end
    end

    function votes = getVotes(neighbors,label)
        votes=[];
        vote3 = 0;
        vote8 = 0;
        for b=1:size(neighbors)
            if label(b) == 3
                vote3 = vote3+1;
            else
                vote8 = vote8+1;
            end
        end
        
        max = 0;
        if vote3>vote8
            max = vote3;
        else
            max = vote8;
        end
        
        for c=1:max
            if vote3>vote8
                votes=[votes;3];
            else
                votes = [votes;8];
            end
        end
    end



    function accuracy = getAccuracy(testset, predict,length)
        correct = 0;
        for n =1:length
            if testset(n,:) == predict(n)
                correct = correct+1;
            end
        end
        accuracy = (correct/length)*100;
    end


end

