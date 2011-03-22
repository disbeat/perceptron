%%%%
%  Computação Adaptativa
%  Trabalho Prático 1
%
%  Grupo 10
%   - Sérgio Santos - 2006125508
%
%  25/09/2009
%%%%
function class = classify(point,W,B)
% Classify a given entry using the perceptron 
    res = sum(point .* W) + B;
    class = hardlim(res);
end