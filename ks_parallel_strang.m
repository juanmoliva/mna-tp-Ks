% Mismos parametros que la Serial Solution, recibiendo un orden de paralelización
function vals = ks_parallel_lie_trotter (x, t, order)
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
      parfor m=0:order*2-1
      
          if(mod(m,2) == 0)
              positive = true;
          else 
            positive = false;
          end

          curr_order = floor(m/2) + 1;

          mult = strang(U, k, delta_t/curr_order, positive, curr_order);
          SUM = SUM + gammas(curr_order)*mult;
      end

      U = SUM;
      vals = [vals;ifft(U)];
  end
end
