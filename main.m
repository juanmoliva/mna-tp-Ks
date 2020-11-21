x = linspace(0, 120, 1000);
t = linspace(0, 120, 1000);

tic

vals = ks_serial (x, t, 10);

toc

[X,Y] = meshgrid(x, t);
figure
mesh(X,Y,real(vals))


