function ShimizuAiyoshi1981Ex2()
	n1::Int64 = 2
	n2::Int64 = 2

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		20*y[2] - 20*y[1] + (x[2] - 20)^2 + (x[1] - 30)^2
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[x[1] + 2*x[2] - 30; 25 - x[2] - x[1]; 15 - x[2]]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		(x[1] - y[1])^2 + (x[2] - y[2])^2
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[10 - y[1]; 10 - y[2]; y[1]; y[2]]
	end

	xy_init = Float64[1;1;1;1]
	Ff_optimal = Float64[225;100;1]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

