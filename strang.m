% Strang
function vals_res = strang(vals, k, delta_t, positive, m)
  if is_plus
    vals_res = non_linear_part(linear_part(non_linear_part(vals, k, delta_t/2), k, h), k, delta_t/2);
  else
    vals_res = linear_part(non_linear_part(linear_part(vals, k, delta_t/2), k, h), k, delta_t/2);
  end

  if m >= 1
    vals_res = strang(vals_res, k, delta_t, positive, m-1);
  end

end
