# Weronika Jasiak
include("../Zadanie1/zad1.jl")
include("../Zadanie2/zad2.jl")
include("../Zadanie3/zad3.jl")

f1(x) = e^(1 - x) - 1
df1(x) = -e^(1 - x)

f2(x) = x * e^(-x)
df2(x) = -e^(-x) * (x - 1)

println("f1(x) = e^(1 - x) - 1")

println("\n10.0")
(r, v, it, err) = mstycznych(f1, df1, 10.0, 10 ^ (-5.0), 10 ^(-5.0), 10000000)
println("Metoda stycznych:")
println("r = ", r)
println("v = ", v)
println("it = ", it)
println("err = ", err)

println("\n0.3")
(r, v, it, err) = mstycznych(f1, df1, 0.3, 10 ^ (-5.0), 10 ^(-5.0), 100)
println("Metoda stycznych:")
println("r = ", r)
println("v = ", v)
println("it = ", it)
println("err = ", err)

println("\n1.0")
(r, v, it, err) = mstycznych(f1, df1, 1.0, 10 ^ (-5.0), 10 ^(-5.0), 100)
println("Metoda stycznych:")
println("r = ", r)
println("v = ", v)
println("it = ", it)
println("err = ", err)

println("\nf2(x) = x * e^(-x)")

println("\n3.0")
(r, v, it, err) = mstycznych(f2, df2, 3.0, 10 ^ (-5.0), 10 ^(-5.0), 100)
println("Metoda stycznych:")
println("r = ", r)
println("v = ", v)
println("it = ", it)
println("err = ", err)

println("\n0.4")
(r, v, it, err) = mstycznych(f2, df2, 0.4, 10 ^ (-5.0), 10 ^(-5.0), 100)
println("Metoda stycznych:")
println("r = ", r)
println("v = ", v)
println("it = ", it)
println("err = ", err)

println("\n-0.25")
(r, v, it, err) = mstycznych(f2, df2, -0.25, 10 ^ (-5.0), 10 ^(-5.0), 100)
println("Metoda stycznych:")
println("r = ", r)
println("v = ", v)
println("it = ", it)
println("err = ", err)
