x = linspace(0, 60, 500);

arr = zeros(900,1);

j = 1;
for i=100:1:1000
t = linspace(0, 60, i);

% función para medir el tiempo transcurrido
tic

    val = ks_serial (x, t, 4);

toc

arr(j) = norm(val,2);
j = j + 1;
end

plot(100:1:1000,arr)
title ('norma 2, paso de 100 a 1000')
