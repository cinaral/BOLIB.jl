function Colson2002BIPA3()
	n1::Int64 = 1
	n2::Int64 = 1

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		(x[1] - 5)^4 + (2*y[1] + 1)^4
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[4 - y[1] - x[1]; x[1]]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		2*x[1] + 6*y[1] + exp(y[1] - x[1]) + 2*x[1]*y[1] + x[1]^2 + y[1]^2
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[x[1] - y[1] + 2; y[1]]
	end

	xy_init = Float64[4;0]
	Ff_optimal = Float64[2;24.02;2]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

