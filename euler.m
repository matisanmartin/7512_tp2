%% Método de Euler
function [v, u] = euler(n, b, w, e, h, f1, f2, v0, u0)

    v=zeros(1,n+1);
    u=zeros(1,n+1);

	v(1) = v0;
	u(1) = u0;

	for i = 1:n
		tau = (i-1)*h
		v(i+1) = v(i) + h*f1(u(i), v(i), b, w, e, tau);
		u(i+1) = u(i) + h*f2(u(i), v(i), b, w, e, tau);
	end
end
