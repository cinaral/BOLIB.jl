module BOLIB

using Symbolics
using SparseArrays

include("BOLIBver2_converted/list_of_examples.jl")

# Include all examples
include.(filter(contains(r".jl$"), readdir(string(@__DIR__, "/BOLIBver2_converted/linear"); join=true)))
include.(filter(contains(r".jl$"), readdir(string(@__DIR__, "/BOLIBver2_converted/nonlinear"); join=true)))
include.(filter(contains(r".jl$"), readdir(string(@__DIR__, "/BOLIBver2_converted/simple"); join=true)))

include("generate_derivatives.jl")

end # module BOLIB
