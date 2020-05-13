close all;
clear all;
clc;

% Matrice per il nuovo set di valori
new_set = zeros(10001, 8);
n = 2;

for i = 1:10001
    
    flag = 0;
    % Genera una word a caso finch� non ne trova una
    % con un  numero di 1 minore o uguale a n
    while (flag == 0)        
        rand = randi([0 1], 1, 8);    
        if (sum(rand) <= n)
            new_set(i, :) = rand;
            flag = 1;
        end
    end    
end