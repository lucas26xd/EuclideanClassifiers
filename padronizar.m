%Função que padroniza os dados a partir do método escolhido.
function [z] = padronizar(mat, mtd)
    if strcmp(mtd, 'zscore')
        z = (mat - mean(mat)) / std(mat);
    else
        z = (mat - min(mat)) / (max(mat) - min(mat));
    end
end