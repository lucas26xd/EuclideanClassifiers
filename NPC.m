%Função que retorna a classe prevista para de um objeto a partir da estratégia de centróide mais próximo.
function [classe] = NPC(p, base)
    %Variáveis Úteis
    qtd_atrib = length(base(1, :))-1;
    
    %ETAPA DE APRENDIZAGEM
    %Descobrindo os centróides de cada classe
    centro1 = mean(base(find(base(:, qtd_atrib+1)==1), 1:qtd_atrib));
    centro2 = mean(base(find(base(:, qtd_atrib+1)==2), 1:qtd_atrib));
    
    %Calculando a distância Euclidian do ponto com os centróides
    d1 = sum((p - centro1) .^ 2) .^ 0.5;
    d2 = sum((p - centro2) .^ 2) .^ 0.5;
    
    %ETAPA DE PREVISAO
    if d1 < d2
        classe = 1;
    else
        classe = 2;
    end
end