% computa un paso "lie trotter".
function new_vals = lie_trotter_paso (vals, k, delta_t, positive)
  if(positive)
    new_vals = linear_part(non_linear_part(vals, k, delta_t), k, delta_t);
  else
    new_vals = non_linear_part(linear_part(vals, k, delta_t), k, delta_t);
  end
 end