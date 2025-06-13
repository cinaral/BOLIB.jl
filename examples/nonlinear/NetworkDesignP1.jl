function NetworkDesignP1()
	n1::Int64 = 5
	n2::Int64 = 5

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		100*x[1] + 100*x[2] + 100*x[3] + 100*x[4] + 100*x[5] + y[3]*(y[3]/(x[3] + 1) + 10) + y[1]*(y[1]/(x[1] + 1) + 50) + y[5]*(y[5]/(x[5] + 1) + 50) + (10*y[2]^2)/(x[2] + 1) + (10*y[4]^2)/(x[4] + 1)
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[x[1] + 1; x[2] + 1; x[3] + 1; x[4] + 1; x[5] + 1]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		y[3]*(y[3]/(2*(x[3] + 1)) + 10) + y[1]*(y[1]/(2*(x[1] + 1)) + 50) + y[5]*(y[5]/(2*(x[5] + 1)) + 50) + (5*y[2]^2)/(x[2] + 1) + (5*y[4]^2)/(x[4] + 1)
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[6 - y[3] - y[5] - y[1]; y[3] - y[2] + y[5]; y[1] + y[3] - y[4]; y[1] + y[3] + y[5] - 6; y[2] - y[3] - y[5]; y[4] - y[3] - y[1]; y[1]; y[2]; y[3]; y[4]; y[5]]
	end

	xy_init = Float64[0;0;0;0;0;0;0;0;0;0]
	Ff_optimal = Float64[300.5;419.8;2]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

