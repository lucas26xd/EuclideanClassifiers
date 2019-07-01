%Código desenvolvido por Lucas Costa Santos.
%Para os sinais desta base, utilizei 4 atributos, a média, desvio padrão, curtose e a assimetria do sinal.
%Ao padronizar os dados tanto pelo o zscore quanto pelo método normal (baseado em máx e min do sinal)
%obtive resultados inferiores aos resultados se padronização, a função de
%padronização foi implementada mas não estou utilizando-a.
%Logo após montar o vetor de características, embaralho as linhas de modo
%que fica 5 objetos de uma classe seguido de 5 da outra e assim por diante.
%A função K_Fold desenvolvida recebe o K, a base de dados e qual será o
%algoritmo utilizado para classificação, retornando a acurácia média das K
%iterações do K_Fold submetidas ao algoritmo especificado.

clear all;
clc;
%IMPORTANDO AS BASES
c1 = importdata('Classe1.mat');
c2 = importdata('Classe2.mat');

%EXTRAINDO OS ATRIBUTOS
%Atributo 1: Média do sinal
m1 = mean(c1);
m2 = mean(c2);
%Atributo 2: Desvio padrão do sinal
std1 = std(c1);
std2 = std(c2);
%Atributo 3: Curtose do sinal
k1 = kurtosis(c1);
k2 = kurtosis(c2);
%Atributo 4: Assimetria do sinal
s1 = skewness(c1);
s2 = skewness(c2);

%PADRONIZANDO (Descomentar caso queira padronizar o sinal antes do treinamento)
%Padronização Z score
% m1 = padronizar(m1, 'zscore'); std1 = padronizar(std1, 'zscore'); k1 = padronizar(k1, 'zscore'); s1 = padronizar(s1, 'zscore');
% m2 = padronizar(m2, 'zscore'); std2 = padronizar(std2, 'zscore'); k2 = padronizar(k2, 'zscore'); s2 = padronizar(s2, 'zscore');

%Padronização normal
% m1 = padronizar(m1, 'normal'); std1 = padronizar(std1, 'normal'); k1 = padronizar(k1, 'normal'); s1 = padronizar(s1, 'normal');
% m2 = padronizar(m2, 'normal'); std2 = padronizar(std2, 'normal'); k2 = padronizar(k2, 'normal'); s2 = padronizar(s2, 'normal');

% PLOTANDO OS ATRIBUTOS (Processo de teste para visualização do quão bom é o atributo escolhido)
plotar(m1, m2, 'Média');
figure;
plotar(std1, std2, 'Desvio Padrão');
figure;
plotar(k1, k2, 'Curtose');
figure;
plotar(s1, s2, 'Assimetria');

%Montando o vetor de características e suas respectivas classes
d1 = [m1.', std1.', k1.', s1.', ones(50,1)];
d2 = [m2.', std2.', k2.', s2.', 2*ones(50,1)];

dados = [];

%Dividindo a base em 10 partes
k_fold = 10; %Mudar aqui caso queira outro valor de K, para o K-Fold

%Embaralhamento a ordem dos sinais
a = 1;
for i = 1:10
    dados = [dados; d1(a:4+a, :)];
    dados = [dados; d2(a:4+a, :)];
    a = a + 5;
end

%Aplicando o Treinamento pelo K-Fold e obtendo a acurácia de acordo com cada algoritmo

%K-Fold para KNN
Ac_KNN = K_Fold(k_fold, dados, 'KNN');

%K-Fold para NPC
Ac_NPC = K_Fold(k_fold, dados, 'NPC');

%K-Fold para AD
Ac_AD = K_Fold(k_fold, dados, 'AD');


