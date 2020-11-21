% frecuencia de dominio
function new_vals = non_linear_part(vals, k, delta_t)
   diff = (1/2*i*k*delta_t).*fft((real(ifft(vals))).^2);
   new_vals = vals - diff;
end