function BenAyedBlair1990b()
	n1::Int64 = 1
	n2::Int64 = 1

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		- x[1] - y[1]
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[	x[1];]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		y[1]
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[4*x[1] + 3*y[1] - 19; 11 - 2*y[1] - x[1]; 13 - y[1] - 3*x[1]; y[1]]
	end

	xy_init = Float64[3;4]
	Ff_optimal = Float64[-6;5;1]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

