%Função que retorna a classe prevista de um objeto a partir da base pela estratégia do KNN.
function [classe] = KNN(p, base)
    %Variáveis Úteis
    len = length(base(:, 1));
    qtd_atrib = length(base(1, :))-1;
    
    k = floor(sqrt(length(base(:, 1)))); %Usando os n^0.5 vizinhos mais próximos
    
    %ETAPA DE APRENDIZAGEM
    %Calcula as distâncias Euclidianas do ponto (p) para todos os outros pontos da base.
    %Guarda a distância e a respectiva classe do ponto atual
    for i = 1:len
        d = sum((p - base(i, 1:qtd_atrib)) .^ 2) .^ 0.5;
        dists(i, :) = [d, base(i, qtd_atrib+1)];
    end
    %Ordenando o vetor apenas pela distância em ordem crescente (primeira coluna)
    [~,idx] = sort(dists(:, 1));
    dists = dists(idx, :);
    %ETAPA DE PREVISAO
    %Pega a classe mais frequente dos k pontos mais próximos.
    classe = mode(dists(1:k, 2));
end

