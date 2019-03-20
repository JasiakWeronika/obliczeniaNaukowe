# Weronika Jasiak
# Funkcja dostępna w języku Julia zwracająca największą liczbę
# całkowitą bezstratnie reprezentowaną przez podane typy
# zmiennopozycyjne
realmax(Float16)   # 6.55e+4
realmax(Float32)   # 3.4028235e38
realmax(Float64)   # 1.7976931348623157e308
# Funkcja myRealMax wyznacza iteracyjnie liczbę (MAX)
# dla wszystkich dostępnych typów zmiennopozycyjnych
# Type - argument funkcji przyjmujący wartości typów
# zmiennopozycyjnych Float16, Float32, Float64
function myRealMax(Type)
    # max - wartość maksymalna
    max = Type(2.0)
    while !isinf(max * 2)
        max *= 2
    end
    # addition - dopełnienie zmiennej max
    addition = Type(max / 2)
    while !isinf(max + addition)
        max += addition
        addition /= 2
    end
    return max
end
# przykładowe wywołania funkcji myRealMax
myRealMax(Float16)   # 6.55e+4
myRealMax(Float32)   # 3.4028235e38
myRealMax(Float64)   # 1.7976931348623157e308
