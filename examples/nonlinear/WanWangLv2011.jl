function WanWangLv2011()
	n1::Int64 = 2
	n2::Int64 = 3

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		(x[1] - x[2] + 2*y[2] + 1)*(y[2] - 2*y[1] - x[1] + 5*y[3] + 8)
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[	]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		2*y[1] - y[2] + y[3]
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[y[1] - y[2] - y[3] + 1; y[1] - 2*x[1] - 2*y[2] + y[3]/2 + 1; y[2] - 2*y[1] - 2*x[2] + y[3]/2 + 1; x[1]; x[2]; y[1]; y[2]; y[3]]
	end

	xy_init = Float64[0;0.5;0;0;0]
	Ff_optimal = Float64[10.62;-0.5;1]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

