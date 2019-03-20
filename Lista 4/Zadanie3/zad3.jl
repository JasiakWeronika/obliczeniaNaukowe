# Weronika Jasiak
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
        for k in range(i + 1, n - 1)
            z = a[k + 1] * x[i]
            a[k] = a[k] - z
        end
    end
    return a
end
