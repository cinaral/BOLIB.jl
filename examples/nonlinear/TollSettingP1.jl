function TollSettingP1()
	n1::Int64 = 3
	n2::Int64 = 8

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		- x[1]*y[3] - x[2]*y[4] - x[3]*y[8]
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[x[1]; x[2]; x[3]]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		2*y[1] + 6*y[2] + 4*y[5] + 2*y[6] + 6*y[7] + x[2]*y[4] + x[3]*y[8] + y[3]*(x[1] + 5)
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[1 - y[2] - y[3] - y[1]; y[1] - y[4] - y[5]; y[2] + y[4] - y[6] - y[7]; y[5] + y[6] - y[8]; 1 - y[7] - y[8] - y[3]; y[1] + y[2] + y[3] - 1; y[4] - y[1] + y[5]; y[6] - y[4] - y[2] + y[7]; y[8] - y[6] - y[5]; y[3] + y[7] + y[8] - 1; y[1]; y[2]; y[3]; y[4]; y[5]; y[6]; y[7]; y[8]]
	end

	xy_init = Float64[0;5;5;0;1;0;0;0;1;0;0]
	Ff_optimal = Float64[-7;12;2]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

