x = linspace(0, 120, 1000);
t = linspace(0, 100, 1000);

arr = zeros(10,1);
j = 1;

for i = 1:10:100
  
  % función para medir el tiempo transcurrido
  tic

  val1 = ks_serial (x, t, i);
  val2 = ks_serial (x, t, i+10);

  toc
  
  arr(j) = norm( val2 - val1 , 2 );
  
  j = j + 1;
end

plot( 1:10:100 , arr )
title ('Error con norma 2')