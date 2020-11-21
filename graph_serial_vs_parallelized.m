% Vectores:
parallel_times = [0];
serial_times = [0];
orders = [0];


for m = 0:5
    order = 1;
    if(m > 0)
        order = m*20;
    end
    
    disp(order);
    
    orders = [orders,order]; 
    
    x = linspace(0, 60, 500);
    t = linspace(0, 60, 500);

    disp('Paralelo');
    tic

    values2 = ks_parallel (x, t, order);

    parallel_times = [parallel_times,toc];

    [X2,Y2] = meshgrid(x, t);
    figure
    mesh(X2,Y2,real(values2)) 

    disp('Serie');
    tic

    values = ks_serial (x, t, order);

    serial_times_vector = [serial_times_vector,toc];

    [X,Y] = meshgrid(x, t);
    figure
    mesh(X,Y,real(values)) 
end

figure
plot(orders,parallel_times,orders,serial_times);
xlabel('Orden');
ylabel('Tiempo');
legend('Paralelo','En serie');


figure
plot(orders, serial_times./parallel_times);
xlabel('Orden');
ylabel('Tiempo en serie / Tiempo en paralelo');
title('Speed up');
