% frecuencia de dominio
function new_vals = linear_part (vals, k, delta_t)
  diff = exp((k.^2-k.^4)*delta_t);
  new_vals = vals.*diff;
end
