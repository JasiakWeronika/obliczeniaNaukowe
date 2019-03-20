# Weronika Jasiak
include("modul.jl")
using modul

fx = ilorazyRoznicowe([3.0, 1.0, 5.0, 6.0], [1.0, -3.0, 2.0, 4.0])
println("ilorazyRoznicowe $fx")
println("warNewton $(warNewton([3.0, 1.0, 5.0, 6.0], fx, 3.0))")
println("naturalna $(naturalna([3.0, 1.0, 5.0, 6.0], fx))")

f(x) = sin(x) * cos(201 * x)
rysujNnfx(f, -10.0, 10.0, 5)
rysujNnfx(f, -10.0, 10.0, 10)
rysujNnfx(f, -15.0, 15.0, 15)
rysujNnfx(f, -15.0, 15.0, 20)
rysujNnfx(f, -15.0, 15.0, 25)

fx = ilorazyRoznicowe([-1.0, 0.0, 1.0, 2.0], [-1.0, 0.0, -1.0, 2.0])
println("naturalna $(naturalna([-1.0, 0.0, 1.0, 2.0], fx))")
