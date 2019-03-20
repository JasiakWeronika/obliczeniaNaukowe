# Weronika Jasiak
# Funkcja rekurencja wykonuje 40 iteracji pętli dla równania
# rekurencyjnego p = p*r*p(1-p) oraz wypisuje jego wyniki,
# które są modelem wzrostu populacji.
# Type - argument funkcji przyjmujący wartości typów
# zmiennopozycyjnych Float32, Float64
function rekurencja(Type)
    # p - wielkoś populacji
    p = Type(0.01)
    # r - pewna dana stała
    r = Type(3)
    for i in range(1, 40)
        p = p + r * p * (Type(1.0) - p)
        println(p)
    end
end
# przykładowe wywołania funkcji
rekurencja(Float32)
rekurencja(Float64)

# Funkcja rekurencjaStop wykonuje 40 iteracji pętli dla równania
# rekurencyjnego p = p*r*p(1-p) oraz wypisuje jego wyniki,
# które są modelem wzrostu populacji. Po pierwszych 10 iteracjach
# nastepuje obcięcie wyniku do 3 cyfr po przecinku, następnie
# zostają wykonane pozostałe iteracje. 
# Type - argument funkcji przyjmujący wartości typów
# zmiennopozycyjnych Float32, Float64
function rekurencjaStop(Type)
    # p - wielkoś populacji
    p = Type(0.01)
    # r - pewna dana stała
    r = Type(3)
    for i in range(1, 40)
        p = p + r * p * (Type(1.0) - p)
        if i == 10
            p = floor(p, 3)
        end
        println(p)
    end
end
# przykładowe wywołania funkcji
rekurencjaStop(Float32)
