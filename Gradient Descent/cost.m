function [cost] = cost(x,y,parameters)
cost = (x*parameters - y)'*(x*parameters - y)/(2*length(y));
end