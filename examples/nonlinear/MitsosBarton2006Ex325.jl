function MitsosBarton2006Ex325()
	n1::Int64 = 2
	n2::Int64 = 3

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		x[1]*y[1] + x[2]*y[1]^2 - x[1]*x[2]*y[3]
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[x[1] + 1; x[2] + 1; 1 - x[1]; 1 - x[2]; x[1]^2 - (y[1]*y[2])/10; -x[2]*y[1]^2]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		x[1]*y[1]^2 + x[2]*y[2]*y[3]
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[y[1] + 1; y[2] + 1; y[3] + 1; 1 - y[1]; 1 - y[2]; 1 - y[3]; y[2]*y[3] - y[1]^2; x[1]*y[1] - y[2]^2*y[3]; y[3]^2 - 1/10]
	end

	xy_init = Float64[1;1;1;1;1]
	Ff_optimal = Float64[-1;-2;2]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

