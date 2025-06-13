# BOLIB.jl

This repository converts the example problems from [Bilevel optimization library of test problems (BOLIBver2)](https://biopt.github.io/bolib/) by Shenglong Zhou, Alain B. Zemkoho, and Andrey Tin into Julia language.

We used a [simple MATLAB script](src/convert_examples_to_julia.m) to convert the examples. Like the MATLAB version, all problems have identical structure. 

However, this version has a few notable differences from the MATLAB version of the BOLIBver2: 
1. ```InfomAllExamp.m``` was replaced with a single file [list_of_examples.jl](examples/list_of_examples.jl) that returns an array of problem names.
2. ```xy_init``` and ```Ff_optimal``` values are recorded inside the corresponding example instead of ```InfomAllExamp.m```.
3. Derivatives can be obtained by generating them symbolically using the provided [generate_derivatives](src/generate_derivatives.jl) function.
4. Sparse matrices are used to represent the derivatives.
5. Only continuous problems have been converted for now, the following problems are currently **not available** in this version:
	- Piecewise problems: 
		1. GumusFloudas2001Ex5
		2. LuDebSinha2016a
		3. LuDebSinha2016b
		4. LuDebSinha2016c
	- Problems with logical flow: 
		1. MorganPatrone2006b
		2. MorganPatrone2006c
	- Problems that require data generation and the Partial Differential Equation toolbox: 
		1. OptimalControl
		2. ShehuEtal2019Ex42

In summary, the [examples](examples/) folder contains 165 bilevel optimization examples (BOLIBv2 has 173):
1. [linear](examples/linear/) : julia files of 24 linear bilevel optimization examples (BOLIBv2 has 24) 
2. [nonlinear](examples/nonlinear/) : julia files of 131 nonlinear bilevel optimization examples (BOLIBv2 has 138) 
3. [simple](examples/simple) : julia files of 10 simple bilevel optimization examples (BOLIBv2 has 11) 
4. [list_of_examples.jl](examples/list_of_examples.jl) : the names of all converted problems

If you would like to convert the problems for yourself or modify the conversion process, please obtain and extract the contents of ```BOLIBver2``` folder from [BOLIBver2.zip (download link)](https://biopt.github.io/files/BOLIBver2.zip) into the ```BOLIBver2/``` folder, then edit or run [convert_examples_to_julia.m](src/convert_examples_to_julia.m).

# Usage
Please see [use_example.jl](use_example.jl) for a demonstration on how to use the examples:
```julia
include("examples/use_example.jl")
```

Include the problem file and call the function which has the identical name to the problem name:
```julia
n₁, n₂, F, G, f, g, xy_init, Ff_optimal = BOLIB.AiyoshiShimizu1984Ex2()
```
Get the derivatives:
```julia
funs, _ = BOLIB.generate_derivatives(n₁, n₂, F, G, f, g)

julia> funs.∇ₓ[TAB]
∇ₓF!        ∇ₓG_cols    ∇ₓG_rows    ∇ₓG_vals!
∇ₓf!        ∇ₓg_cols    ∇ₓg_rows    ∇ₓg_vals!
∇ₓ²F_cols   ∇ₓ²F_rows   ∇ₓ²F_vals!  ∇ₓ²G_cols
∇ₓ²G_rows   ∇ₓ²G_vals!  ∇ₓ²f_cols   ∇ₓ²f_rows
∇ₓ²f_vals!  ∇ₓ²g_cols   ∇ₓ²g_rows   ∇ₓ²g_vals!
```
Remember that all functions are in-place and all matrices are represented as sparse matrices, for example:
```julia
∇ₓG_vals = zeros(length(funs.∇ₓG_rows))
funs.∇ₓG_vals!(∇ₓG_vals, x)
∇ₓG = sparse(funs.∇ₓG_rows, funs.∇ₓG_cols, ∇ₓG_vals)
```

Now we are ready to solve this problem!