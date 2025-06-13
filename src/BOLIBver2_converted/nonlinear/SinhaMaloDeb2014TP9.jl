function SinhaMaloDeb2014TP9()
	n1::Int64 = 10
	n2::Int64 = 10

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		(x[1] - 1)^2 + (x[2] - 1)^2 + (x[3] - 1)^2 + (x[4] - 1)^2 + (x[5] - 1)^2 + (x[6] - 1)^2 + (x[7] - 1)^2 + (x[8] - 1)^2 + (x[9] - 1)^2 + (x[10] - 1)^2 + y[1]^2 + y[2]^2 + y[3]^2 + y[4]^2 + y[5]^2 + y[6]^2 + y[7]^2 + y[8]^2 + y[9]^2 + y[10]^2
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[	]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		exp((x[1]^2 + x[2]^2 + x[3]^2 + x[4]^2 + x[5]^2 + x[6]^2 + x[7]^2 + x[8]^2 + x[9]^2 + x[10]^2)*(y[1]^2/4000 + y[2]^2/4000 + y[3]^2/4000 + y[4]^2/4000 + y[5]^2/4000 + y[6]^2/4000 + y[7]^2/4000 + y[8]^2/4000 + y[9]^2/4000 + y[10]^2/4000 - cos(y[4]/2)*cos(y[9]/3)*cos((2^(1/2)*y[2])/2)*cos((3^(1/2)*y[3])/3)*cos((2^(1/2)*y[8])/4)*cos((5^(1/2)*y[5])/5)*cos((6^(1/2)*y[6])/6)*cos((7^(1/2)*y[7])/7)*cos((10^(1/2)*y[10])/10)*cos(y[1]) + 1))
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[pi - y[1]; pi - y[2]; pi - y[3]; pi - y[4]; pi - y[5]; pi - y[6]; pi - y[7]; pi - y[8]; pi - y[9]; pi - y[10]; y[1] + pi; y[2] + pi; y[3] + pi; y[4] + pi; y[5] + pi; y[6] + pi; y[7] + pi; y[8] + pi; y[9] + pi; y[10] + pi]
	end

	xy_init = Float64[0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0]
	Ff_optimal = Float64[0;1;2]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

