% Metodo de Runge-Kutta orden 2 %

function [v, u] = rk2(n, b, w, e, h, f1, f2, v0, u0)

    v=zeros(1, n+1);
    u=zeros(1, n+1);

	v(1) = v0;
	u(1) = u0;

	for i = 1:n
		tau = (i-1)*h;
		k1 = h*f1(u(i), v(i), b, w, e, tau);
		q1 = h*f2(u(i), v(i), b, w, e, tau);
		k2 = h*f1(u(i)+q1, v(i)+k1, b, w, e, tau);
		q2 = h*f2(u(i)+q1, v(i)+k1, b, w, e, tau);

		v(i+1) = v(i) + (k1+k2)/2;
		u(i+1) = u(i) + (q1+q2)/2;
	end
end
