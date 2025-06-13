function DesignCentringP4()
	n1::Int64 = 4
	n2::Int64 = 6

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		-(x[1] - x[3])*(x[2] - x[4])
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[y[1] + y[2]^2; 3/4 - y[4] - y[3]/4; y[6] + 1]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		y[1] - y[3]/4 - y[4] + y[6] + y[2]^2
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[x[1] - y[1]; x[2] - y[2]; x[1] - y[3]; x[2] - y[4]; x[1] - y[5]; x[2] - y[6]; y[1] - x[3]; y[2] - x[4]; y[3] - x[3]; y[4] - x[4]; y[5] - x[3]; y[6] - x[4]]
	end

	xy_init = Float64[1;1;1;1;1;1;1;1;1;1]
	Ff_optimal = Float64[NaN;NaN;0]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

