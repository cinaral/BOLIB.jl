function MitsosBarton2006Ex328()
	n1::Int64 = 5
	n2::Int64 = 5

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		- x[1]^2 - x[2]^2 - x[3]^2 - x[4]^2 - x[5]^2 - y[1]^2 - y[2]^2 - y[3]^2 - y[4]^2 - y[5]^2
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[x[1] + 1; x[2] + 1; x[3] + 1; x[4] + 1; x[5] + 1; 1 - x[1]; 1 - x[2]; 1 - x[3]; 1 - x[4]; 1 - x[5]; x[1] - y[1]*y[2]; exp(x[2]) - y[3] - x[1]; -x[2]*y[1]^2]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		y[3]/10 + y[2]^2*(x[1] + x[2]) + y[1]^3 + x[3]*x[4]*x[5]*(y[4]^2 + y[5]^2)
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[y[1] + 1; y[2] + 1; y[3] + 1; y[4] + 1; y[5] + 1; 1 - y[1]; 1 - y[2]; 1 - y[3]; 1 - y[4]; 1 - y[5]; 3/10 - y[1]*y[2]; y[3]^2 - x[1] + 1/5; exp(y[3]) - y[4]*y[5] + 1/10]
	end

	xy_init = Float64[1;1;1;1;1;1;1;1;1;1]
	Ff_optimal = Float64[-10;-3.1;2]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

