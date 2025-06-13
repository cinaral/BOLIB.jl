function BenAyedBlair1990a()
	n1::Int64 = 1
	n2::Int64 = 2

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		- (3*x[1])/2 - 6*y[1] - y[2]
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[x[1]; 1 - x[1]]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		- y[1] - 5*y[2]
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[5 - 3*y[1] - y[2] - x[1]; 5 - y[1] - 3*y[2] - 2*x[1]; y[1]; y[2]]
	end

	xy_init = Float64[1;1;1]
	Ff_optimal = Float64[-2.5;-5;1]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

