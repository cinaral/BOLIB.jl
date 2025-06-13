function LanWenShihLee2007()
	n1::Int64 = 1
	n2::Int64 = 1

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		2*x[1] - 11*y[1]
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[	x[1];]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		x[1] + 3*y[1]
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[2*y[1] - x[1] + 4; y[1] - 2*x[1] + 24; 96 - 4*y[1] - 3*x[1]; 126 - 7*y[1] - x[1]; 4*x[1] - 5*y[1] + 65; x[1] + 4*y[1] - 8; y[1]]
	end

	xy_init = Float64[1;1]
	Ff_optimal = Float64[-85.0855;50.174;2]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

