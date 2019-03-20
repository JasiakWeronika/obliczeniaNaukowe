# Author Weronika Jasiak

include("blocksys.jl")
include("matrixgen.jl")

using matrixgen
using blocksys

print("Jeśli chcesz sprawdzić działanie programu wywołaj funkcję tests(x, y, z, pivot),\n
        x, y, z - numer jednej z dostępnych opcji znajdujących się poniżej,\n
        pivot - true/false w zależności od tego czy ma zostać wybrany element główny\n")
print("x\n")
print("1 eliinacja Gaussa - rozwiązanie układu równań Ax=b\n")
print("2 wyznaczenie rozkład LU - rozwiązanie układu równań LUx=b\n")
print("y\n")
print("1 macierz rzadka o rozmiarze 16x16 z blokami wielkości 4\n")
print("2 macierz rzadka o rozmiarze 10000x10000 z blokami wielkości 4\n")
print("3 macierz rzadka o rozmiarze 50000x50000 z blokami wielkości 4\n")
print("z\n")
print("1 wektor b wczytany z pliku\n")
print("2 wektor b obliczony przy pomocy funkcji\n")
print("Dla y = 0 i z = 2 zostanie wygenerowana losowa macierz\n")

function tests(x::Int64, y::Int64, z::Int64, pivot::Bool)
    if (pivot != true && pivot != false)
        error("Pivot przyjmuje tylko wartośći true lub false\n")
    end

    if y == 0
        blockmat(5000, 4, 1.0, "matrix.txt")
        a = openFileWithMatrix("matrix.txt")
    elseif y == 1
        a = openFileWithMatrix("A/A.txt")
    elseif y == 2
        a = openFileWithMatrix("B/A.txt")
    elseif y == 3
        a = openFileWithMatrix("C/A.txt")
    else
        error("Wybierz dla y jedną z podanych opcji")
    end

    if z == 1
        if y == 1
            b = openFileWithVectorOfRightSites("A/b.txt")
        elseif y == 2
            b = openFileWithVectorOfRightSites("B/b.txt")
        elseif y == 3
            b = openFileWithVectorOfRightSites("C/b.txt")
        end
    elseif z == 2
        b = calculationOfRightSideVector(a[1], a[2], a[3])
    else
        error("Wybierz dla y jedną z podanych opcji")
    end

    if x == 1
        c = gaussianElimination(a[1], b, a[2], a[3], pivot)
        if z == 1
            saveVectorXToFile("x.txt", c, a[2], false)
            print("Wynik został zapisany w pliku x.txt")
        elseif z == 2
            saveVectorXToFile("x.txt", c, a[2], true)
            print("Wynik został zapisany w pliku x.txt")
        end
    elseif x == 2
        c =  gaussianEliminationLU(a[1], a[2], a[3], pivot)
        if pivot == false
            p = collect(1:a[2])
        elseif pivot == true
            p = c[2]
        end
        d =  decompositionOfLU(c[1], b, a[2], a[3], pivot, p)
        if z == 1
            saveVectorXToFile("x.txt", d, a[2], false)
            print("Wynik został zapisany w pliku x.txt")
        elseif z == 2
            saveVectorXToFile("x.txt", d, a[2], true)
            print("Wynik został zapisany w pliku x.txt")
        end
    else
        error("Wybierz dla x jedną z podanych opcji")
    end
end

function times(n::Int64)
    t = 0
    m = 0
    for i in 1:n
        a = openFileWithMatrix("C/A.txt")
        b = openFileWithVectorOfRightSites("C/b.txt")
        c = @timed gaussianElimination(a[1], b, a[2], a[3], true)
        t += c[2]
        m += c[3]
    end
    println("$(t/n)\n$(m/n)")
end

function testTimeGauss()
    for i in 1000 : 1000 : 10000
        blockmat(i, 4, 1.0, "test.txt")
        a = openFileWithMatrix("test.txt")
        b = calculationOfRightSideVector(a[1], a[2], a[3])
        c = @time gaussianElimination(a[1], b, a[2], a[3], false)
    end
end

function testTimeLU()
    for i in 1000 : 1000 : 10000
        blockmat(i, 4, 1.0, "test.txt")
        a = openFileWithMatrix("test.txt")
        b = calculationOfRightSideVector(a[1], a[2], a[3])
        c = gaussianEliminationLU(a[1], a[2], a[3], true)
        d = @time decompositionOfLU(c[1], b, a[2], a[3], true, c[2])
    end
end

a = openFileWithMatrix("D/A.txt")
b = openFileWithVectorOfRightSites("D/b.txt")
c = gaussianElimination(a[1], b, a[2], a[3], false)
saveVectorXToFile("w.txt", c, a[2], false)

a = openFileWithMatrix("D/A.txt")
b = openFileWithVectorOfRightSites("D/b.txt")
c = gaussianElimination(a[1], b, a[2], a[3], true)
saveVectorXToFile("w.txt", c, a[2], false)

a = openFileWithMatrix("C/A.txt")
b = calculationOfRightSideVector(a[1], a[2], a[3])
c1 = gaussianElimination(a[1], b, a[2], a[3], false)
c2 = gaussianElimination(a[1], b, a[2], a[3], true)
saveVectorXToFile("gaussianEliminationFalseTrue.txt", c1, a[2], true)
saveVectorXToFile("gaussianEliminationTrueTrue.txt", c2, a[2], true)

a = openFileWithMatrix("C/A.txt")
b = calculationOfRightSideVector(a[1], a[2], a[3])
c = gaussianEliminationLU(a[1], a[2], a[3], false)
x = gaussianEliminationLU(a[1], a[2], a[3], true)
p = collect(1:a[2])
d1 = decompositionOfLU(c, b, a[2], a[3], true, p)
d2 = decompositionOfLU(x[1], b, a[2], a[3], true, x[2])
saveVectorXToFile("LU.txt", d1, a[2], true)
saveVectorXToFile("LUPivot.txt", d2, a[2], true)
