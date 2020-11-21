function vals_res = step(gammas, m, delta_t, vals, k)
  vals_res = gammas(m)*(lie_trotter(vals, k, delta_t/m, false, m) + lie_trotter(vals, k, delta_t/m, true, m));
end