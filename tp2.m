%% 75.12 - Análisis Numérico 1 - TP2 %%
close all;

% Constantes
ti = 0;
tf = 100;
h = 0.5;
t = ti:h:tf;
n=ceil((tf-ti)/h);

% Funciones a partir de la discretización
phi = @(tau) cos(tau);
f1 = @(u, v, b, w, e, tau) u;
f2 = @(u, v, b, w, e, tau) -b*u + (w^2 - e*phi(tau))*sin(v);

% parametros --> b_i = [b, e, w, v, u] %
b1 = [0.1, 0.1, 0.05, 0.1, -0.1];
b2 = [0.1, 0.1, 0.01, 0.2, -0.2];
b3 = [0.1, 0.1, 0.01, 0.05, -0.05];
b4 = [0.1, 0.1, 0.01, 0.1, -0.1];
b5 = [0.1, 0.1, 0.1, 0.1, -0.1];
b6 = [0.1, 0.1, 0.1, 0.01, -0.01];
parameters = [b1; b2; b3; b4; b5; b6];

% Recorre todos los parametros y genera graficos para cada caso
for i=1:6
    bi = parameters(i,:);
    b = bi(1);
    e = bi(2);
    w = bi(3);
    v0 = bi(4);
    u0 = bi(5);
    [v_euler, u_euler] = euler(n, b, w, e, h,f1, f2, v0, u0);
    [v_rk2, u_rk2] = rk2(n, b, w, e, h, f1, f2, v0, u0);
    [v_rk4, u_rk4] = rk4(n, b, w, e, h, f1, f2, v0, u0);

    % Graficos de v vs t
    filename_v = strcat('plot_v', '_b=', num2str(b), '_e=', num2str(e), '_w=', num2str(w), '_u0=', num2str(u0), '_v0=', num2str(v0));
    title_v = strcat('t vs v(t) para ', ' b=', num2str(b), ' e=', num2str(e), ' w=', num2str(w), ' u0=', num2str(u0), ' v0=', num2str(v0));
    rv = plot_results(t, v_euler, 'Euler', v_rk2, 'Runge-Kutta Orden 2', v_rk4, 'Runge-Kutta Orden 4', 't', 'v(t)', title_v, filename_v);

    % Graficos de dv vs t
    filename_u = strcat('plot_u', '_b=', num2str(b), '_e=', num2str(e), '_w=', num2str(w), '_u0=', num2str(u0), '_v0=', num2str(v0));
    title_u = strcat('t vs v''(t) para ', ' b=', num2str(b), ' e=', num2str(e), ' w=', num2str(w), ' u0=', num2str(u0), ' v0=', num2str(v0));
    ru = plot_results(t, u_euler, 'Euler', u_rk2, 'Runge-Kutta Orden 2', u_rk4, 'Runge-Kutta Orden 4', 't', 'v''(t)', title_u, filename_u);

    % Graficos de fase
    filename_uv = strcat('plot_phase', '_b=', num2str(b), '_e=', num2str(e), '_w=', num2str(w), '_u0=', num2str(u0), '_v0=', num2str(v0));
    title_uv = strcat('Grafico de fase para ', ' b=', num2str(b), ' e=', num2str(e), ' w=', num2str(w), ' u0=', num2str(u0), ' v0=', num2str(v0));
    ruv = plot_phase_result(v_euler, u_euler, 'Euler', v_rk2, u_rk2, 'Runge-Kutta Orden 2', v_rk4, u_rk4, 'Runge-Kutta Orden 4', 'v(t)', 'v''(t)', title_uv, filename_uv);
end
