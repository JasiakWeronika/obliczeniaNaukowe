# Weronika Jasiak
# Funkcja obliczająca ilorazy różnicowe.
# x - wektor długości n+1 zawierający węzły x_0, ..., x_n
# x[1]=x_0, ..., x[n+1]=x_n
# f - wektor długości n+1 zawierający wartości interpolowanej
# funkcji w węzłach f(x_0), ..., f(x_n)
function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})
    n = length(f) # n - długość wektora f
    fx = Vector{Float64}(n) # fx - wektor długości n+1 zawierający obliczone ilorazy różnicowe
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
