function LuDebSinha2016e()
	n1::Int64 = 1
	n2::Int64 = 2

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		25*(x[1] - 5/2)^2 + (y[2] - 50)^2/900
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[x[1] - 2; 3 - x[1]; y[1] + 4; y[2] + 100; 10 - y[1]; 200 - y[2]]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		-y[2]
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[x[1]*(y[1] - 2)^2 - y[2]; y[2] - (25*x[1]*(y[1] - 5))/2; (5*y[1] - 5*x[1] + 20)*(y[1] - x[1] + 8) - y[2]]
	end

	xy_init = Float64[1;1;1]
	Ff_optimal = Float64[NaN;NaN;0]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

