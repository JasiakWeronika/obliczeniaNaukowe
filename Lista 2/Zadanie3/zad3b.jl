# Weronika Jasiak
# Korzystajac z programu matcond.jl zostaje wygenerowana macierz A,
# następnie zostają wykonane obliczenia pozwalające ustalić
# wskaźnik uwarunkowania, rząd oraz błędy.
include("matcond.jl")
n = [5, 10, 20]
c = [1.0, 10.0, 10^3, 10^7, 10^12, 10^16]
for i in range(1, length(n))
    for j in range(1, length(c))
        # A - wygenerowana losowa macierz
        A = matcond(n[i], c[j])
        # x - tablica wypełniona samymi zerami
        x = ones(Float64, n[i])
        # b - wektor prawych stron
        b = A * x
        # metoda1 - algorytm eliminacji Gaussa
        metoda1 = A \ b
        # metoda2 - algorytm odwrotności macierzy
        metoda2 = inv(A) * b
        println("rozmiar $(n[i]) x $(n[i])")
        println("wskaźnik uwarunkowania       \t $(cond(A))")
        println("rząd                         \t $(rank(A))")
        println("błąd względny dla x=A\\b     \t $(norm(metoda1 - x) / norm(x))")
        println("błąd względny dla x=inv(A)*b \t $(norm(metoda2 - x) / norm(x))")
        println("----------------------------------------------------------------------------------")
    end
end
