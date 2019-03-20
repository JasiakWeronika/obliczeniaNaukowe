# Weronika Jasiak
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
