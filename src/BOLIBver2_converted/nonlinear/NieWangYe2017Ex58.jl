function NieWangYe2017Ex58()
	n1::Int64 = 4
	n2::Int64 = 4

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		(x[1] + x[2] + x[3] + x[4])*(y[1] + y[2] + y[3] + y[4])
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[1 - x[2]^2 - x[3]^2 - x[4]^2 - x[1]^2; x[4] - y[3]^2; x[1] - y[2]*y[4]]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		y[3]/10 + y[4]/2 + x[1]*y[1] + x[2]*y[2] - y[3]*y[4]
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[x[2] + x[4] + x[1]^2 + x[3]^2 - y[1]^2 - 2*y[2]^2 - 3*y[3]^2 - 4*y[4]^2; y[1]*y[4] - y[2]*y[3]]
	end

	xy_init = Float64[0.5442;0.4682;0.4904;0.4942;-0.7792;-0.5034;-0.2871;-0.1855]
	Ff_optimal = Float64[-3.488;-0.862;2]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

