function MitsosBarton2006Ex322()
	n1::Int64 = 1
	n2::Int64 = 1

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		(x[1] + 3/5)^2 + y[1]^2
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[x[1] + 1; 1 - x[1]]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		y[1]*((2*x[1])/25 - (9*x[1]^2)/250 + x[1]^3/250) - y[1]^3*((2*x[1])/15 - 2/15) - y[1]^2*(x[1]^2/50 - (4*x[1])/25 + 2/5) + y[1]^4
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[y[1] + 1; 1 - y[1]; y[1]^2 - x[1]^2/100 - 1/100]
	end

	xy_init = Float64[1;1]
	Ff_optimal = Float64[0.2095;-0.0656;1]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

