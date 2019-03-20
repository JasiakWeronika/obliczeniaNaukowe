# Weronika Jasiak
include("../Zadanie1/zad1.jl")
include("../Zadanie2/zad2.jl")
include("../Zadanie3/zad3.jl")

f(x) = sin(x) - (x / 2)^2
df(x) = cos(x) - (x / 2)

println("f(x) = sin(x) - (x / 2)^2")

(r, v, it, err) = mbisekcji(f, 1.5, 2.0, 0.5 * 10 ^ (-5.0), 0.5 * 10 ^ (-5.0))
println("\nMetoda bisekcji:")
println("r = ", r)
println("v = ", v)
println("it = ", it)
println("err = ", err)

(r, v, it, err) = mstycznych(f, df, 1.5, 0.5 * 10 ^ (-5.0), 0.5 * 10 ^(-5.0), 50)
println("\nMetoda stycznych:")
println("r = ", r)
println("v = ", v)
println("it = ", it)
println("err = ", err)

(r, v, it, err) = msiecznych(f, 1.0, 2.0, 0.5 * 10 ^ (-5.0), 0.5 * 10 ^ (-5.0), 50)
println("\nMetoda siecznych:")
println("r = ", r)
println("v = ", v)
println("it = ", it)
println("err = ", err)
