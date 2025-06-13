module BOLIB

using Symbolics
using SparseArrays

include("../examples/list_of_examples.jl")

# Include all examples
include.("../" .* filter(contains(r".jl$"), readdir("examples/linear"; join=true)))
include.("../" .* filter(contains(r".jl$"), readdir("examples/nonlinear"; join=true)))
include.("../" .* filter(contains(r".jl$"), readdir("examples/simple"; join=true)))

include("generate_derivatives.jl")

end # module BOLIB
