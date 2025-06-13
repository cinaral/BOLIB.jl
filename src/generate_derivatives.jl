"""
Generate derivative functions
"""
function generate_derivatives(n₁, n₂, F, G, f, g)
    nₓ = n₁ + n₂ # length(x)
    x_dummy = zeros(nₓ)
    m₁ = length(G(x_dummy))
    m₂ = length(g(x_dummy))
    x_sym = Symbolics.@variables(x[1:nₓ])[1] |> Symbolics.scalarize
    F_sym = F(x_sym)
    G_sym = G(x_sym)
    f_sym = f(x_sym)
    g_sym = g(x_sym)

    # First-order derivatives --- ∇ₓ
    ∇ₓF_sym = Symbolics.gradient(F_sym, x_sym)
    ∇ₓf_sym = Symbolics.gradient(f_sym, x_sym)
    ∇ₓG_sym = Symbolics.sparsejacobian(G_sym, x_sym)
    ∇ₓg_sym = Symbolics.sparsejacobian(g_sym, x_sym)
    @assert(nₓ == length(∇ₓF_sym))
    @assert(nₓ == length(∇ₓf_sym))
    @assert((m₁, nₓ) == size(∇ₓG_sym))
    @assert((m₂, nₓ) == size(∇ₓg_sym))
    # ∇ₓF!(val, x)
    ∇ₓF! = Symbolics.build_function(∇ₓF_sym, x_sym; expression=Val{false})[2]
    # ∇ₓf!(val, x)
    ∇ₓf! = Symbolics.build_function(∇ₓf_sym, x_sym; expression=Val{false})[2]
    # ∇ₓG_rows, ∇ₓG_cols, ∇ₓG!(val, x)
    (∇ₓG_rows, ∇ₓG_cols, ∇ₓG_vals_sym) = SparseArrays.findnz(∇ₓG_sym)
    ∇ₓG_vals! = Symbolics.build_function(∇ₓG_vals_sym, x_sym; expression=Val{false})[2]
    # ∇ₓg_rows, ∇ₓg_cols, ∇ₓg!(val, x)
    (∇ₓg_rows, ∇ₓg_cols, ∇ₓg_vals_sym) = SparseArrays.findnz(∇ₓg_sym)
    ∇ₓg_vals! = Symbolics.build_function(∇ₓg_vals_sym, x_sym; expression=Val{false})[2]

    # Second-order derivatives --- ∇ₓ²
    ∇ₓ²F_sym = Symbolics.sparsejacobian(∇ₓF_sym, x_sym)
    ∇ₓ²f_sym = Symbolics.sparsejacobian(∇ₓf_sym, x_sym)
    ∇ₓ²G_sym = Symbolics.sparsejacobian(vec(Matrix(∇ₓG_sym)), x_sym) # passing a full vectorized matrix
    ∇ₓ²g_sym = Symbolics.sparsejacobian(vec(Matrix(∇ₓg_sym)), x_sym)
    @assert((nₓ, nₓ) == size(∇ₓ²F_sym))
    @assert((nₓ, nₓ) == size(∇ₓ²f_sym))
    @assert((m₁ * nₓ, nₓ) == size(∇ₓ²G_sym))
    @assert((m₂ * nₓ, nₓ) == size(∇ₓ²g_sym))
    # ∇ₓ²F_rows, ∇ₓ²F_cols, ∇ₓ²F!(val, x)
    (∇ₓ²F_rows, ∇ₓ²F_cols, ∇ₓ²F_vals_sym) = SparseArrays.findnz(∇ₓ²F_sym)
    ∇ₓ²F_vals! = Symbolics.build_function(∇ₓ²F_vals_sym, x_sym; expression=Val{false})[2]
    # ∇ₓ²f_rows, ∇ₓ²f_cols, ∇ₓ²f!(val, x)
    (∇ₓ²f_rows, ∇ₓ²f_cols, ∇ₓ²f_vals_sym) = SparseArrays.findnz(∇ₓ²f_sym)
    ∇ₓ²f_vals! = Symbolics.build_function(∇ₓ²f_vals_sym, x_sym; expression=Val{false})[2]
    # ∇ₓ²G_rows, ∇ₓ²G_cols, ∇ₓ²G!(val, x)
    (∇ₓ²G_rows, ∇ₓ²G_cols, ∇ₓ²G_vals_sym) = SparseArrays.findnz(∇ₓ²G_sym)
    ∇ₓ²G_vals! = Symbolics.build_function(∇ₓ²G_vals_sym, x_sym; expression=Val{false})[2]
    # ∇ₓ²g_rows, ∇ₓ²g_cols, ∇ₓ²g!(val, x)
    (∇ₓ²g_rows, ∇ₓ²g_cols, ∇ₓ²g_vals_sym) = SparseArrays.findnz(∇ₓ²g_sym)
    ∇ₓ²g_vals! = Symbolics.build_function(∇ₓ²g_vals_sym, x_sym; expression=Val{false})[2]

    funs = (;
        ∇ₓF!,
        ∇ₓf!,
        ∇ₓG_rows,
        ∇ₓG_cols,
        ∇ₓG_vals!,
        ∇ₓg_rows,
        ∇ₓg_cols,
        ∇ₓg_vals!,
        ∇ₓ²F_rows,
        ∇ₓ²F_cols,
        ∇ₓ²F_vals!,
        ∇ₓ²f_rows,
        ∇ₓ²f_cols,
        ∇ₓ²f_vals!,
        ∇ₓ²G_rows,
        ∇ₓ²G_cols,
        ∇ₓ²G_vals!,
        ∇ₓ²g_rows,
        ∇ₓ²g_cols,
        ∇ₓ²g_vals!
    )
    syms = (;
        F=F_sym,
        f=f_sym,
        G=G_sym,
        g=g_sym,
        ∇ₓF=∇ₓF_sym,
        ∇ₓf=∇ₓf_sym,
        ∇ₓG=∇ₓG_sym,
        ∇ₓg=∇ₓg_sym,
        ∇ₓ²F=∇ₓ²F_sym,
        ∇ₓ²f=∇ₓ²f_sym,
        ∇ₓ²G=∇ₓ²G_sym,
        ∇ₓ²g=∇ₓ²g_sym,
    )

    (funs, syms)
end