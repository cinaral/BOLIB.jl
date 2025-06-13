using BOLIB

include("list_of_examples.jl")
@assert length(examples) == 165

# Include examples that you need:
include.("../" .* filter(contains(r".jl$"), readdir("examples/linear"; join=true)))
include.("../" .* filter(contains(r".jl$"), readdir("examples/nonlinear"; join=true)))
include.("../" .* filter(contains(r".jl$"), readdir("examples/simple"; join=true)))

n₁, n₂, F, G, f, g, xy_init, Ff_optimal = AiyoshiShimizu1984Ex2() # replace this with any available example
funs, syms = generate_derivatives(n₁, n₂, F, G, f, g)

x = xy_init # x = [x₁; x₂] (instead of x and y)
F(x)
f(x)
m₁ = length(G(x))
m₂ = length(g(x))

# Derivatives use in-place functions:
∇ₓF = zeros(n₁ + n₂)
funs.∇ₓF!(∇ₓF, x)
display(∇ₓF)

# Matrix derivatives are represented as sparse matrices:
∇ₓG_vals = zeros(length(funs.∇ₓG_rows))
funs.∇ₓG_vals!(∇ₓG_vals, x)
∇ₓG = BOLIB.sparse(funs.∇ₓG_rows, funs.∇ₓG_cols, ∇ₓG_vals)
display(∇ₓG)