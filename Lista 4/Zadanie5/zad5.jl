# Weronika Jasiak
include("../Zadanie4/zad4.jl")
f(x) = e^x
rysujNnfx(f, 0.0, 1.0, 5)
rysujNnfx(f, 0.0, 1.0, 10)
rysujNnfx(f, 0.0, 1.0, 15)

g(x) = (x^2) * sin(x)
rysujNnfx(g, -1.0, 1.0, 5)
rysujNnfx(g, -1.0, 1.0, 10)
rysujNnfx(g, -1.0, 1.0, 15)
