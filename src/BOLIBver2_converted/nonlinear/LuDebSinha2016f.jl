function LuDebSinha2016f()
	n1::Int64 = 2
	n2::Int64 = 1

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		-x[2]
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[y[1] - 2; 4 - y[1]; x[1] + 80; x[2] + 100; 200 - x[1]; 200 - x[2]; y[1]*(x[1]/20 - 2)^2 - x[2]; x[2] - (25*y[1]*(x[1]/20 - 5))/2; (x[1]/4 - 5*y[1] + 20)*(x[1]/20 - y[1] + 8) - x[2]]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		(x[1] - 50)^2/784 + 25*(y[1] - 5/2)^2
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[	]
	end

	xy_init = Float64[1;1;1]
	Ff_optimal = Float64[NaN;NaN;0]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

