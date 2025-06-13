function HendersonQuandt1958()
	n1::Int64 = 1
	n2::Int64 = 1

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		x[1]*(x[1]/2 + y[1]/2 - 95)
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[200 - x[1]; x[1]]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		y[1]*(x[1]/2 + y[1] - 100)
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[	y[1];]
	end

	xy_init = Float64[0;0]
	Ff_optimal = Float64[-3266.67;-711.11;2]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

