function Colson2002BIPA1()
	n1::Int64 = 1
	n2::Int64 = 1

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		- (x[1] - 10)^3 - (y[1] - 10)^3
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[5 - x[1]; x[1] - y[1]; x[1]]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		(x[1] + 2*y[1] - 15)^4
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[20 - y[1] - x[1]; 20 - y[1]; y[1]]
	end

	xy_init = Float64[10;10]
	Ff_optimal = Float64[250;0;1]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

