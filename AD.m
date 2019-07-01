%Função que retorna a classe prevista de um objeto a partir da estratégia
%de Árvore de Decisão, encontrado os limiares de decisão a partir de
%observações dos atributos dos sinais.
function [classe] = AD(p)
    %ETAPA DE APRENDIZAGEM
    %O ponto p tem que está no seguinte formato, p = [m, d, k, s], sendo
    % m a média do sinal
    % d o desvio padrão do sinal
    % k a curtose do sinal
    % s a assimetria do sinal
    % e o dados não padronizados.
    %Por meio de observações pude constatar perceber 3 abordagens de classificação por AD
    %2 com acurácias muito boas e 1 não tão boa, curtose e assimetria do sinal e média combinada com o desvio padrão, respectivamente.
    
    %Aŕvore 1: Curtose > 5 é classe 1 e classe 2, caso contrário.
    %Com os dados desta base, esta AD individualmente tem acurácia média de 100%
    if p(3) > 5
        c(1) = 1;
    else
        c(1) = 2;
    end
    
    %Árvore 2: Assimetria > 0.2 é classe 1 e classe 2, caso contrário.
    %Com os dados desta base, esta AD individualmente tem acurácia média de 100%
    if p(4) > 0.2
        c(2) = 1;
    else
        c(2) = 2;
    end
    
    %Árvore 3: média < 0 ou desvio padrão > 1 é classe 2 e classe 1, caso contrário.
    %Com os dados desta base, esta AD individualmente tem acurácia média de 93%
    if p(1) < 0 || p(2) > 1 
        c(3) = 2;
    else
        c(3) = 1;
    end
    
    %ETAPA DE PREVISÃO
    %Como foram 3 árvores, a fim de deixar o classificador mais robusto, a
    %classe prevista para o ponto p será a classe que foi mais indicada
    %dentre as 3 árvores
    classe = mode(c);
end