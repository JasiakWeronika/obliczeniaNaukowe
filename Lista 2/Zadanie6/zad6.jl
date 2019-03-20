# Weronika Jasiak
# Funkcja wykonuje 40 kolejnych iteracji pętli dla równania
# rekurencyjnego opisanego wzorem s =
# c - pewna dana stała
# x - wartość, od której i po której nastąpi iteracja
function rekurencja(c, x)
    for i in range(1, 40)
        x = x^(2.0) + c
        println(x)
    end
end
# przykładowe wywołania funkcji
rekurencja(-2, 1)
rekurencja(-2, 2)
rekurencja(-2, 1.99999999999999)
rekurencja(-1, 1)
rekurencja(-1, -1)
rekurencja(-1, 0.75)
rekurencja(-1, 0.25)
