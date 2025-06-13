function Outrata1990Ex1e()
	n1::Int64 = 2
	n2::Int64 = 2

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		(y[1] - 3)^2/2 + (y[2] - 4)^2/2 + x[1]^2/10 + x[2]^2/10 - 25/2
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[	]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		x[1]*(y[1] - 3*y[2]) + (y[1]*(y[1] + 3*y[2]))/2 - x[2]*(2*y[1] - 3*y[2]) + (y[2]*(3*y[1] + 10*y[2]))/2
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[(333*y[1])/1000 - y[2] + 2; (333*y[2])/1000 - y[1] + 2; y[1]; y[2]]
	end

	xy_init = Float64[6;-3;3;3]
	Ff_optimal = Float64[-3.15;-16.29;2]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

