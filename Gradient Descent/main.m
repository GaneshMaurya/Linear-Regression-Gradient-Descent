clc
clear all
close all
dataSet = load('DataSet.txt');
x = dataSet(:,1);
y = dataSet(:,2);

normalisation = true;
if (normalisation)
    maxX = max(x);
    minX = min(x);
    x = (x - maxX)/(maxX - minX);
end

x = [ones(length(x),1) x];

figure;
plot(x(:,2),y,'rx','MarkerSize',10);
xlabel('Size(Sq. mts.)');
ylabel('Preice');
title('Housing Prices');

parameters = [0;0];
learningRate = 0.1;
repetition = 1500;
[parameters,costHistory] = gradient(x,y,parameters,learningRate,repetition);

figure;
plot(min(x(:,2)):max(x(:,2)),parameters(1) + parameters(2)*(min(x(:,2)):max(x(:,2))));
hold on;

plot(x(:,2),y,'rx','MarkerSize',10);

figure;
plot(costHistory,1:repetition);

input = 1200;
if(normalisation)
    input = (input - maxX)/(maxX- minX);
end

output = parameters(1) + parameters(2)*input;
disp(output);