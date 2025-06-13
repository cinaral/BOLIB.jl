function ClarkWesterberg1988()
	n1::Int64 = 1
	n2::Int64 = 1

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		x[1] - 4*y[1]
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[	]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		y[1]
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[2*x[1] - y[1]; 108 - 5*y[1] - 2*x[1]; 3*y[1] - 2*x[1] - 4]
	end

	xy_init = Float64[20;0]
	Ff_optimal = Float64[-37;14;1]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

