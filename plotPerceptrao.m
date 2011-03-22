%%%%
%  Computação Adaptativa
%  Trabalho Prático 1
%
%  Grupo 10
%   - Sérgio Santos - 2006125508
%
%  25/09/2009
%%%%
function plotPerceptrao(points, points_result, rects)
% Display a given rect and test table

    clf % Clear all figures
    hold on % Keep the figure active for multiple plots
 
    axis([-1 2 -1 2]);
    
    points0 = points(points_result==0, :);
    plot(points0(:,1), points0(:,2), 'o', 'MarkerEdgeColor','b');

    points1 = points(points_result==1, :); 
    plot(points1(:,1), points1(:,2), '*', 'MarkerEdgeColor','r');
    
    for i = 1:size(rects,1)
        [X,Y] = calcRectValues(rects(i,:));
        line(X,Y, 'Color', [0,1,0]);
    end
    
    hold off

end

function [X,lineValues] = calcRectValues(rect)
% Generate values for the given line for a plot
    X = -1:0.1:2;
    lineValues = rect(1) * X + rect(2);
end