function TollSettingP4()
	n1::Int64 = 2
	n2::Int64 = 4

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		- x[1]*(y[2] + y[3]) - x[2]*y[3]
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[	]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		8*y[1] + 6*y[4] + y[2]*(2*x[1] + 3) + y[3]*(2*x[1] + 2*x[2] + 3)
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[1 - y[2] - y[1]; 1 - y[4] - y[3]; y[1] + y[2] - 1; y[3] + y[4] - 1; y[1]; y[2]; y[3]; y[4]]
	end

	xy_init = Float64[1;1;1;1;1;1]
	Ff_optimal = Float64[-4;14;2]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

