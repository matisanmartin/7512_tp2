% Metodo de Runge-Kutta orden 4 %
function [v,u] = rk4(t, b, w, e, h, f1, f2, v0, u0)

    v=zeros(1,t+1);
    u=zeros(1,t+1);

	v(1) = v0;
	u(1) = u0;

	for i = 1:t
        tau = (i-1)*h
		k1 = h*f1(u(i), v(i), b, w, e, tau);
		q1 = h*f2(u(i), v(i), b, w, e, tau);

        k2 = h*f1(u(i)+q1*1/2, v(i)+k1*1/2, b, w, e, tau);
        q2 = h*f2(u(i)+q1*1/2, v(i)+k1*1/2, b, w, e, tau);

        k3 = h*f1(u(i)+q2*1/2, v(i)+k2*1/2, b, w, e, tau);
        q3 = h*f2(u(i)+q2*1/2, v(i)+k2*1/2, b, w, e, tau);

        k4 = h*f1(u(i)+q3, v(i)+k3, b, w, e, tau);
        q4 = h*f2(u(i)+q3, v(i)+k3, b, w, e, tau);

        v(i+1) = v(i) + (1/6)*(k1+2*k2+2*k3+k4);
		u(i+1) = u(i) + (1/6)*(q1+2*q2+2*q3+q4);
	end
end
