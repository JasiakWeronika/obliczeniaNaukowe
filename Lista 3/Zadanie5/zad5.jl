# Weronika Jasiak
include("../Zadanie1/zad1.jl")

f(x) = (3 * x) - e^x

println("f(x) = 3x - e^x\n")

println("[0.0, 1.0]")

(r, v, it, err) = mbisekcji(f, 0.0, 1.0, 10 ^ (-4.0), 10 ^ (-4.0))
println("Metoda bisekcji:")
println("r = ", r)
println("v = ", v)
println("it = ", it)
println("err = ", err)

println("\n[1.0, 2.0]")

(r, v, it, err) = mbisekcji(f, 1.0, 2.0, 10 ^ (-4.0), 10 ^ (-4.0))
println("Metoda bisekcji:")
println("r = ", r)
println("v = ", v)
println("it = ", it)
println("err = ", err)

println("\n[0.0, 2.0]")

(r, v, it, err) = mbisekcji(f, 0.0, 2.0, 10 ^ (-4.0), 10 ^ (-4.0))
println("Metoda bisekcji:")
println("r = ", r)
println("v = ", v)
println("it = ", it)
println("err = ", err)
