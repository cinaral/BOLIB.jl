function LuDebSinha2016d()
	n1::Int64 = 2
	n2::Int64 = 2

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		-x[2]
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[x[1] + 4; x[2] + 100; 10 - x[1]; 200 - x[2]; y[1] + 4; y[2] + 100; 10 - y[1]; 200 - y[2]; (y[1]/14 + 16/7)*(x[1] - 2)^2 - x[2]; x[2] - ((25*y[1])/28 + 200/7)*(x[1] - 5); (5*x[1] - (5*y[1])/14 + 60/7)*(x[1] - y[1]/14 + 40/7) - x[2]]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		-y[2]
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[(x[1]/14 + 16/7)*(y[1] - 2)^2 - y[2]; y[2] - ((25*x[1])/28 + 200/7)*(y[1] - 5); (5*y[1] - (5*x[1])/14 + 60/7)*(y[1] - x[1]/14 + 40/7) - y[2]]
	end

	xy_init = Float64[1;1;1;1]
	Ff_optimal = Float64[NaN;NaN;0]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

