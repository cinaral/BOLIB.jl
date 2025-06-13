function ShimizuEtal1997b()
	n1::Int64 = 1
	n2::Int64 = 1

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		16*x[1]^2 + 9*y[1]^2
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[x[1]; 4*x[1] - y[1]]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		(x[1] + y[1] - 20)^4
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[y[1]; 50 - y[1] - 4*x[1]]
	end

	xy_init = Float64[1;1]
	Ff_optimal = Float64[2250;197.75;1]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

