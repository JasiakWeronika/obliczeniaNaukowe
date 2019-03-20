# Weronika Jasiak
# Funkcja  interpolująca zadaną funkcję f(x) w przedziale [a, b] za
# pomocą wielomianu interpolacyjnego stopnia n w postaci Newtona.
# Następnie rysuje wielomian interpolacyjny i interpolacyjną funkcję.
# f - funkcja f(x) zadana jako anonimowa funkcja,
# a, b - przedział interpolacji
# n - stopień wielomianu interpolacyjnego
include("../Zadanie1/zad1.jl")
include("../Zadanie2/zad2.jl")
using PyPlot
function rysujNnfx(f, a::Float64, b::Float64, n::Int)
    x = Vector{Float64}(n + 1)
    y = Vector{Float64}(n + 1)
    fx = Vector{Float64}(n + 1)
    details = 33
    h = (b - a) / n
    k = 0.0
    for i in range(1, n + 1)
        x[i] = a + (k * h)
        y[i] = f(x[i])
        k += 1.0
    end
    fx = ilorazyRoznicowe(x, y)
    plotX = Vector{Float64}(details * (n + 1))
    plotY = Vector{Float64}(details * (n + 1))
    plotH = Vector{Float64}(details * (n + 1))
    n = (n + 1) * details
    h = (b - a) / (n - 1)
    k = 0.0
    for i in range(1, n)
        plotX[i] = a + (k * h)
        plotY[i] = f(plotX[i])
        plotH[i] = warNewton(x, fx, plotX[i])
        k += 1.0
    end
    plot(linspace(a, b, n), plotY, color ="blue", label ="wielomian interpolacyjny")
    plot(linspace(a, b, n), plotH, color ="red", label= "interpolowana funkcja")
end
