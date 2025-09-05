% cd(./src)
addpath(genpath("../BOLIBver2/Examples"))
addpath(genpath("../BOLIBver2/Examples/Linear"))
addpath(genpath("../BOLIBver2/Examples/Nonlinear"))
addpath(genpath("../BOLIBver2/Examples/Simple"))

num_problems = 173; % max 173 from InfomAllExamp.m

list_fileID = fopen(strcat("./BOLIBver2_converted/list_of_examples.jl"),'w');
fprintf(list_fileID, strcat("examples = [\n"));

for i = 1:num_problems
	%for i = 131:132
	% 2025-05-16
	% CalamaiVicente1994b has a bug where xy_init is 7 long...
	% 49, 50, 51 are piecewise (36 isn't piecewise but generates piecewise for some reason)
	% 79-80 has if else statements
	% 138 requires partial differential equation toolbox
	% 173 has weird probname
	if i == 36 || i == 49 || i == 50 || i == 51 || i == 79 || i == 80 || i == 138 || i == 173
		continue
	end
	
	fprintf('converting %d\n',i)
	[probname, dim, xy, Ff] = InfomAllExamp(i);
	x = sym("x", [dim(1) 1], "real");
	y = sym("y", [dim(2) 1], "real");
	fun = str2func(probname);
	
	if i == 131 || i == 132
		F = simplify(fun(x, y, "F"));
		G = simplify(fun(x, y, "G"));
		f = simplify(fun(x, y, "f"));
		g = simplify(fun(x, y, "g"));
	else
		F = fun(x, y, "F");
		G = fun(x, y, "G");
		f = fun(x, y, "f");
		g = fun(x, y, "g");
	end
	
	fprintf(list_fileID, strcat("\t""", probname, """\n"));
	
	% from InfomAllExamp.m
	if i < 139
		prob_fileID = fopen(strcat("./BOLIBver2_converted/nonlinear/", probname,'.jl'),'w');
	elseif i >= 139 && i < 163
		prob_fileID = fopen(strcat("./BOLIBver2_converted/linear/", probname,'.jl'),'w');
	else
		prob_fileID = fopen(strcat("./BOLIBver2_converted/simple/", probname,'.jl'),'w');
	end
	
	
	fprintf(prob_fileID, strcat("function ", probname, "()\n"));
	fprintf(prob_fileID, strcat("\tn1::Int64 = ", string(dim(1))));
	fprintf(prob_fileID, "\n");
	fprintf(prob_fileID, strcat("\tn2::Int64 = ", string(dim(2))));
	fprintf(prob_fileID, "\n\n");
	
	print_body(prob_fileID, "F", F, dim(1), dim(2))
	print_body(prob_fileID, "G", -G, dim(1), dim(2), true)
	print_body(prob_fileID, "f", f, dim(1), dim(2))
	print_body(prob_fileID, "g", -g, dim(1), dim(2), true)
	
	fprintf(prob_fileID, strcat("\txy_init = Float64", string(mat2str(xy)), "\n"));
	fprintf(prob_fileID, strcat("\tFf_optimal = Float64", string(mat2str(Ff')), "\n\n"));
	
	fprintf(prob_fileID, strcat("\t(; n1, n2, F, G, f, g, xy_init, Ff_optimal)\n"));
	fprintf(prob_fileID, strcat("end ", "\n\n"));
	
	fclose(prob_fileID);
end

fprintf(list_fileID, strcat("]\n"));
fclose(list_fileID);

function [] = print_views(fileID)
fprintf(fileID, strcat("\t\tx = @view xy[1:n1]\n"));
fprintf(fileID, strcat("\t\ty = @view xy[n1+1:n1+n2]\n"));
end


function [] = print_body(fileID, fun_name, expr, nx, ny, is_arr_out)
if nargin < 6
	is_arr_out = false;
end

fprintf(fileID, strcat("\tfunction ", fun_name, "(xy)\n"));
print_views(fileID)
fprintf(fileID, "\t"); % tab

% replace x1, y2... etc with x[1], y[2]...
char_expr = char(expr);
for j = nx:-1:1
	char_expr = replace(char_expr, strcat("x", string(j)), strcat("x[", string(j), "]"));
end

for j = ny:-1:1
	char_expr = replace(char_expr, strcat("y", string(j)), strcat("y[", string(j), "]"));
end

if is_arr_out && length(expr) < 2 % we expect an array of length 1
	fprintf(fileID, "\t[");
end
fprintf(fileID, strcat("\t", char_expr));

if is_arr_out && length(expr) == 1
	fprintf(fileID, ";");
end
if is_arr_out && length(expr) < 2
	fprintf(fileID, "]");
end

fprintf(fileID, "\n\tend\n\n");
end