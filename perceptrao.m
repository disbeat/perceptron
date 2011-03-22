%%%%
%  Computação Adaptativa
%  Trabalho Prático 1
%
%  Grupo 10
%   - Sérgio Santos - 2006125508
%
%  25/09/2009
%%%%
function [W,B] = perceptrao(points, points_result)
% Return the weights for a given test table

    % Initialization
    W = [randomValue randomValue];
    B = randomValue;

    % Ten iterations of the algorithm
    for iteration = 1:10
        
        % p = [-W1/W2 -B/W2]
        rect = calcRect(W,B);       

        % Display
        plotPerceptrao(points, points_result, rect);
        pause(0.2)

        % Algorithm
        for ind_point = 1:length(points)
           point = points(ind_point,:);
           point_result = points_result(ind_point);

           % Get the output for the given entries (point)
           output = classify(point,W,B);

           % Correct the weights if there is error
           if point_result ~= output
               error = point_result - output;
               dW = error .* point;
               dB = error;       
               W = W + dW;
               B = B + dB;
           end
        end

    end

end

function value = randomValue
% Return a random value in [-1 , 1]
    value = rand(1) * 2 - 1;
end




