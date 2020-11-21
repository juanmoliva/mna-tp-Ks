% calcula las soluciones para los coeficientes.
function gammas = get_gammas(order)
    gammas = zeros(order,1);

    n = order/2;

    A1eq = ones (1,order);
    A2eq = zeros(floor(n),order);
    B = [0.5];

    for k=1:floor(n)
        B = [B;0];
        for i=1:floor(order)
            A2eq(k,i) = power(i,(-2*k));
        end
    end

    A = [A1eq ; A2eq];

    gammas = linsolve(A,B);

end