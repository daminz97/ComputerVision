load('data.mat');
temp = reshape(data.train.x, [784, 200]);
model = linearTrain(temp, data.train.y);

temp = reshape(data.test.x, [784,200]);
ypred = linearPredict(model, temp);

correct = 0;

for i=1:200
    if ypred(i) == data.test.y(i)
        correct = correct+1;
    end
end

accuracy = correct/200;
disp(accuracy);
