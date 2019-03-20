# Weronika Jasiak
# Korzystajac z programu hilb.jl zostaje wygenerowana macierz A,
# następnie zostają wykonane obliczenia pozwalające ustalić
# wskaźnik uwarunkowania, rząd oraz błędy.
include("hilb.jl")
for i in range(1, 20)
    # A - wygenerowana macierz Hilberta
    A = hilb(i)
    # x - tablica wypełniona samymi zerami
    x = ones(Float64, i)
    # b - wektor prawych stron
    b = A * x
    # metoda1 - algorytm eliminacji Gaussa
    metoda1 = A \ b
    # metoda2 - algorytm odwrotności macierzy
    metoda2 = inv(A) * b
    println("rozmiar $i x $i")
    println("wskaźnik uwarunkowania       \t $(cond(A))")
    println("rząd                         \t $(rank(A))")
    println("błąd względny dla x=A\\b     \t $(norm(metoda1 - x) / norm(x))")
    println("błąd względny dla x=inv(A)*b \t $(norm(metoda2 - x) / norm(x))")
    println("----------------------------------------------------------------------------------")
end
