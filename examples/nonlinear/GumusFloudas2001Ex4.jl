function GumusFloudas2001Ex4()
	n1::Int64 = 1
	n2::Int64 = 1

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		(x[1] - 3)^2 + (y[1] - 2)^2
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[x[1]; 8 - x[1]; 2*x[1] - y[1] + 1; 2*y[1] - x[1] - 2; 14 - 2*y[1] - x[1]]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		(y[1] - 5)^2
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[y[1]; 10 - y[1]]
	end

	xy_init = Float64[1;1]
	Ff_optimal = Float64[9;0;1]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

