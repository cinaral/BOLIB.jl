function Bard1988Ex2()
	n1::Int64 = 4
	n2::Int64 = 4

	function F(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		(y[2] + y[4])*(y[2] + y[4] - 160) + (y[1] + y[3])*(y[1] + y[3] - 200)
	end

	function G(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[40 - x[2] - x[3] - x[4] - x[1]; 10 - x[1]; 5 - x[2]; 15 - x[3]; 20 - x[4]; x[1]; x[2]; x[3]; x[4]]
	end

	function f(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		(y[1] - 4)^2 + (y[4] - 2)^2 + (y[2] - 13)^2 + (y[3] - 35)^2
	end

	function g(xy)
		x = @view xy[1:n1]
		y = @view xy[n1+1:n1+n2]
		[x[1] - (2*y[1])/5 - (7*y[2])/10; x[2] - (3*y[1])/5 - (3*y[2])/10; x[3] - (2*y[3])/5 - (7*y[4])/10; x[4] - (3*y[3])/5 - (3*y[4])/10; 20 - y[1]; 20 - y[2]; 40 - y[3]; 40 - y[4]; y[1]; y[2]; y[3]; y[4]]
	end

	xy_init = Float64[5;5;15;15;0;0;0;0]
	Ff_optimal = Float64[-6600;54;1]

	(; n1, n2, F, G, f, g, xy_init, Ff_optimal)
end 

