# Weronika Jasiak
module modul
export ilorazyRoznicowe
export warNewton
export naturalna
export rysujNnfx

# Funkcja obliczająca ilorazy różnicowe.
# x - wektor długości n+1 zawierający węzły x_0, ..., x_n
# x[1]=x_0, ..., x[n+1]=x_n
# f - wektor długości n+1 zawierający wartości interpolowanej
# funkcji w węzłach f(x_0), ..., f(x_n)
function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})
    n = length(f) # n - długość wektora f
    fx = Vector{Float64}(n) # fx - tablica zmiennych z jednym wskaźnikiem
    for i in range(1, n)
        fx[i] = f[i]
    end
    for j in range(2, n)
		for i in n:-1:j
			fx[i] = (fx[i] - fx[i - 1]) / (x[i] - x[i - j + 1])
		end
	end
	return fx
end

# Funkcja obliczająca wartość wielomianu interpolacyjnego stopnia n w
# postaci Newtona w punkcie x=t za pomocą uogólnionego algorytmu Hornera.
# x - wektor długości n+1 zawierający węzły x_0, ..., x_n
# x[1]=x_0, ..., x[n+1]=x_n
# fx - wektor długości n+1 zawierający ilorazy różnicowe
# fx[1]=f[x_0], fx[2]=f[x_0, x_1], ...,
# fx[n]=f[x_0, ..., x_n-1], fx[n+1]=f[x_0, ..., x_n]
# t - punkt, w którym należy obliczyć wartość wielomianu
function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)
    n = length(fx) # n - długość wektora fx
    nt = fx[n] # nt - wartość wielomianu w punkcie t
	for k = n - 1: -1: 1
		nt = fx[k] + (t - x[k]) * nt
	end
    return nt
end

# Funkcja obliczająca współczynniki postaci naturalnej wielomianu
# interpolacyjnego w postaci Newtona.
# x - wektor długości n+1 zawierający węzły x_0, ..., x_n
# x[1]=x_0, ..., x[n+1]=x_n
# fx - wektor długości n+1 zawierający ilorazy różnicowe
# fx[1]=f[x_0], fx[2]=f[x_0, x_1], ...,
# fx[n]=f[x_0, ..., x_n-1], fx[n+1]=f[x_0, ..., x_n]
function naturalna(x::Vector{Float64}, fx::Vector{Float64})
    n = length(fx) # n - długość wektora fx
    a = Vector{Float64}(n) # a - wektor długości n+1 zawierający obliczone współczynniki postaci naturalnej
	a[n] = fx[n]
    for i in n - 1: -1: 1
        z = a[i + 1] * x[i]
        a[i] = fx[i] - z
        for k in i + 1: n - 1
            z = a[k + 1] * x[i]
            a[k] = a[k] - z
        end
    end
    return a
end

# Funkcja  interpolująca zadaną funkcję f(x) w przedziale [a, b] za
# pomocą wielomianu interpolacyjnego stopnia n w postaci Newtona.
# Następnie rysuje wielomian interpolacyjny i interpolacyjną funkcję.
# f - funkcja f(x) zadana jako anonimowa funkcja,
# a, b - przedział interpolacji
# n - stopień wielomianu interpolacyjnego
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
end
