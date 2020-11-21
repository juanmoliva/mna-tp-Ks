% lie trotter con orden m
function val = lie_trotter(vals, k, delta_t, positive, m)
    
    if(m <= 1)
      val = lie_trotter_paso(vals, k, delta_t, positive);
    else
      val = lie_trotter_paso(lie_trotter(vals, k, delta_t, positive, m-1), k, delta_t, positive);
    end
    
end