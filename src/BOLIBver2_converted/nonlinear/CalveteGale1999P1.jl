function CalveteGale1999P1()
	n1::Int64 = 2
	n2::Int64 = 3

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		4*y[1] - 4*x[2] - 8*x[1] - 40*y[2] - 4*y[3]
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[x[1]; x[2]]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		(x[1] + x[2] + 2*y[1] - y[2] + y[3] + 1)/(2*x[1] + y[1] + y[2] - 3*y[3] + 6)
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[y[1]; y[2]; y[3]; y[1] - y[2] - y[3] + 1; y[1] - 2*x[1] - 2*y[2] + y[3]/2 + 1; y[2] - 2*y[1] - 2*x[2] + y[3]/2 + 1]
	end

	xy_init = Float64[0;0.5;0;0.5;0]
	Ff_optimal = Float64[-29.2;0.31;1]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

