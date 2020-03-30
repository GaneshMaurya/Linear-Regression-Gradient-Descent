function [parameters,costHistory] = gradient(x,y,parameters,learningRate,repetition)
m = length(y);
costHistory = zeros(repetition,1);
for i = 1:repetition
    h = (x*parameters - y)';
    parameters(1) = parameters(1) - learningRate*(1/m)*h*x(:,1);
    parameters(2) = parameters(2) - learningRate*(1/m)*h*x(:,2);
    costHistory = cost(x,y,parameters);
end

costHistory(i) = cost(x,y,parameters);