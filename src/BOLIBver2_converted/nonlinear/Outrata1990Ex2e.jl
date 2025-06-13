function Outrata1990Ex2e()
	n1::Int64 = 1
	n2::Int64 = 2

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		(y[1] - 3)^2/2 + (y[2] - 4)^2/2
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[	x[1];]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		(y[1]^2*(x[1] + 1))/2 - y[1]*((1333*x[1])/1000 + 3) - x[1]*y[2] + y[2]^2/2
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[x[1] - y[2] - y[1]*(x[1]/10 - 333/1000); y[2]*(x[1]/10 + 333/1000) - y[1] + 2; y[1]; y[2]]
	end

	xy_init = Float64[0;0;0]
	Ff_optimal = Float64[0.9;-14.94;2]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

