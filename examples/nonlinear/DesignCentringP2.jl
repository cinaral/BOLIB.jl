function DesignCentringP2()
	n1::Int64 = 4
	n2::Int64 = 6

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		-x[3]*x[4]*pi
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[y[1] + y[2]^2; 3/4 - y[4] - y[3]/4; y[6] + 1; 1 - x[3]; 1 - x[4]]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		y[1] - y[3]/4 - y[4] + y[6] + y[2]^2
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[- (x[1] - y[1])^2/x[3]^2 - (x[2] - y[2])^2/x[4]^2; - (x[1] - y[3])^2/x[3]^2 - (x[2] - y[4])^2/x[4]^2; - (x[1] - y[5])^2/x[3]^2 - (x[2] - y[6])^2/x[4]^2]
	end

	xy_init = Float64[10;10;10;10;10;10;10;10;10;10]
	Ff_optimal = Float64[NaN;NaN;0]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

