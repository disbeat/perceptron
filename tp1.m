%%%%
%  Computa��o Adaptativa
%  Trabalho Pr�tico 1
%
%  Grupo 10
%   - S�rgio Santos - 2006125508
%
%  25/09/2009
%%%%
function tp1

    % Points - Entradas dos neur�nios
    % Points_Result - Sa�da esperada dos neur�rios
    % W - Pesos das entradas
    % B - Peso do limiar

    % N1 - AND
    points = [0 0; 0 1; 1 0; 1 1];
    points_result = [0; 0; 0; 1];
    
    [N1_W, N1_B] = perceptrao(points, points_result);

    % N2 - OR
    points = [0 0; 0 1; 1 0; 1 1];
    points_result = [0; 1; 1; 1];
    
    [N2_W, N2_B] = perceptrao(points, points_result);
    
    % N3 - NAND + OR
    points = [0 0; 0 1; 1 1];
    points_result = [0; 1; 0];
    
    [N3_W, N3_B] = perceptrao(points, points_result);
    
    % Classifying XOR using the 3 neural cells
    
    points = [0 0; 0 1; 1 0; 1 1];
    points_result = zeros(1,4);

    for ind_point = 1:length(points)
       point = points(ind_point,:);
       
       N1 = classify(point, N1_W, N1_B);
       N2 = classify(point, N2_W, N2_B);
       N3 = classify([N1 N2], N3_W, N3_B);
       
       points_result(ind_point) = N3;
    end
    
    % Displaying the final result
    rects = [calcRect(N1_W,N1_B) ; calcRect(N2_W,N2_B)];
    plotPerceptrao(points, points_result, rects);

end