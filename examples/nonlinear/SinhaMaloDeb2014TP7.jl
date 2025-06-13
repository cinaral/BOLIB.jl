function SinhaMaloDeb2014TP7()
	n1::Int64 = 2
	n2::Int64 = 2

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		-((x[1] + y[1])*(x[2] + y[2]))/(x[1]*y[1] + x[2]*y[2] + 1)
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[x[1]; x[2]; x[2] - x[1]; 100 - x[2]^2 - x[1]^2]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		((x[1] + y[1])*(x[2] + y[2]))/(x[1]*y[1] + x[2]*y[2] + 1)
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[y[1]; y[2]; x[1] - y[1]; x[2] - y[2]]
	end

	xy_init = Float64[1;1;0;1]
	Ff_optimal = Float64[-1.961;1.961;2]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

