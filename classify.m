%%%%
%  Computa��o Adaptativa
%  Trabalho Pr�tico 1
%
%  Grupo 10
%   - S�rgio Santos - 2006125508
%
%  25/09/2009
%%%%
function class = classify(point,W,B)
% Classify a given entry using the perceptron 
    res = sum(point .* W) + B;
    class = hardlim(res);
end