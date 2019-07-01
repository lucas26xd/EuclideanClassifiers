%Função que realiza o método de separação da base em treinamento e teste baseado no método K_Fold
function acuracia = K_Fold(k_fold, dados, alg)
    %Variáveis Úteis
    len = length(dados(:, 1));
    pts_fold = floor(len/k_fold);
    qtd_atrib = length(dados(1, :))-1;
    acc = 0;
    
    %K-Fold
    for i = 0:pts_fold:len-1
        acertos = 0;
        %Dividindo a base de treinamento e teste segundo o K-Fold
        base = [dados(1:i, :); dados((i + pts_fold + 1):len, :)];
        %Realizando o procedimento para cada ponto do fold de teste
        for j = 1:pts_fold
           %Classifica o dado de entrada pelo algoritmo selecionado
           if strcmp(alg, 'KNN')
                previsao = KNN(dados(j+i, 1:qtd_atrib), base);
           else
               if strcmp(alg, 'NPC')
                previsao = NPC(dados(j+i, 1:qtd_atrib), base);
               else
                   if strcmp(alg, 'AD')
                       previsao = AD(dados(j+i, 1:4));
                   end
               end
           end
           %Testa se acertou ou não
           if previsao == dados(j, qtd_atrib+1)
               acertos = acertos + 1;
           end
        end
        %Acurácia de cada iteração(fold)
        fprintf("Acurácia do %s no %dº fold: %.4f.\n", alg, (i/pts_fold)+1, acertos/pts_fold);
        acc = acc + (acertos/pts_fold);
    end
    %Acurácia Total
    fprintf("Acurácia do %s Média: %.4f.\n\n", alg, acc/k_fold);
    acuracia = acc/k_fold;
end