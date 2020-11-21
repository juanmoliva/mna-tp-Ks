% Recibe un linespace para los valores de X y T.
% Retorna una matriz con la imagen de la funcion

function vals = ks_serial (x, t, order)

    [~,N] = size(x);
    delta_x = x(2) - x(1);
    delta_t = t(2) - t(1);
    delta_k = 2*pi/(N*delta_x);
    k = [0:delta_k:(N/2-1)*delta_k,0,-(N/2-1)*delta_k:delta_k:-delta_k];

    
    gammas = get_gammas(order);


    u = cos(x/16).*(1 + sin(x/16));
    U = fft(u);
    vals = [u];
    [~, t_size] = size(t);
    
    
    
    for n = 1:t_size-1
      SUM = 0;

      for m=1:order
        SUM = SUM + step(gammas, m, delta_t, U, k);
      end
        
        
      U = SUM;
      vals = [vals;ifft(U)];

    end

end
