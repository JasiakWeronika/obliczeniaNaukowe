# Weronika Jasiak
# Przy użyciu pakietu PyPlot zostaje narysowany wykres
# funkcji f(x)=e^(x)*log(1+e^(-x))
using PyPlot
x = range(0, 0.1, 1000); y = exp.(x) .* log.(1 + exp.(-x))
plot(x, y, color="red", linewidth=1.0, linestyle="--")
# Przy użyciu pakietu Sympy zostaje obliczona granica
# funkcji, gdy x->oo.
using SymPy
f(x) = exp.(x) .* log.(1 + exp.(-x))
x = oo
println("x->oo, lim e^(x)*log(1+e^(-x)) = $(limit(f, x)).")
