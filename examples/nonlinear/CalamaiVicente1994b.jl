function CalamaiVicente1994b()
	n1::Int64 = 4
	n2::Int64 = 2

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		(x[1] - 1)^2/2 + (x[2] - 1)^2/2 + (x[3] - 1)^2/2 + (x[4] - 1)^2/2 + y[1]^2/2 + y[2]^2/2
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[	]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		y[1]^2/2 - x[2]*y[2] - x[1]*y[1] + y[2]^2/2
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[y[1] - x[1] + 1; y[2] - x[2] + 1; 3/2 - y[1] - x[1]; 3 - y[2] - x[2]; x[1] + y[1] - 1; x[2] + y[2] - 1]
	end

	xy_init = Float64[1;1;1;1;1;1;1]
	Ff_optimal = Float64[0.3125;-0.4063;1]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

