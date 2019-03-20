# Weronika Jasiak
include("../Zadanie1/zad1.jl")
include("../Zadanie2/zad2.jl")
include("../Zadanie3/zad3.jl")

f1(x) = e^(1 - x) - 1
df1(x) = -e^(1 - x)

f2(x) = x * e^(-x)
df2(x) = -e^(-x) * (x - 1)

println("f1(x) = e^(1 - x) - 1")

println("\nx0=20.0, x1=30.00")
(r, v, it, err) = msiecznych(f1, 20.00, 30.0, 10 ^ (-5.0), 10 ^ (-5.0), 50)
println("Metoda siecznych:")
println("r = ", r)
println("v = ", v)
println("it = ", it)
println("err = ", err)

println("\nx0=-0.4, x1=1.3")
(r, v, it, err) = msiecznych(f1, -0.4, 1.3, 10 ^ (-5.0), 10 ^ (-5.0), 50)
println("Metoda siecznych:")
println("r = ", r)
println("v = ", v)
println("it = ", it)
println("err = ", err)

println("\nx0=-2.0, x1=2.0")
(r, v, it, err) = msiecznych(f1, -2.0, 2.0, 10 ^ (-5.0), 10 ^ (-5.0), 50)
println("Metoda siecznych:")
println("r = ", r)
println("v = ", v)
println("it = ", it)
println("err = ", err)

println("\nx0=0.5, x1=1.5")
(r, v, it, err) = msiecznych(f1, 0.5, 1.5, 10 ^ (-5.0), 10 ^ (-5.0), 50)
println("Metoda siecznych:")
println("r = ", r)
println("v = ", v)
println("it = ", it)
println("err = ", err)


println("\nf2(x) = x * e^(-x)")

println("\nx0=5.0, x1=10.0")
(r, v, it, err) = msiecznych(f2, 5.0, 10.0, 10 ^ (-5.0), 10 ^ (-5.0), 50)
println("Metoda siecznych:")
println("r = ", r)
println("v = ", v)
println("it = ", it)
println("err = ", err)

println("\nx0=-1.0, x1=0.3")
(r, v, it, err) = msiecznych(f2, -1.0, 0.3, 10 ^ (-5.0), 10 ^ (-5.0), 50)
println("Metoda siecznych:")
println("r = ", r)
println("v = ", v)
println("it = ", it)
println("err = ", err)

println("\nx0=10.0, x1=20.0")
(r, v, it, err) = msiecznych(f2, 10.0, 20.0, 10 ^ (-5.0), 10 ^ (-5.0), 50)
println("Metoda siecznych:")
println("r = ", r)
println("v = ", v)
println("it = ", it)
println("err = ", err)

println("\nx0=-0.5, x1=0.5")
(r, v, it, err) = msiecznych(f2, -0.5, 0.5, 10 ^ (-5.0), 10 ^ (-5.0), 50)
println("Metoda siecznych:")
println("r = ", r)
println("v = ", v)
println("it = ", it)
println("err = ", err)
