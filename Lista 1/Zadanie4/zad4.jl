# Weronika Jasiak
# Funkcja numberFromTheRange wyznacza liczbę zmiennopozycyjną x
# w arytmetyce Float64 z przedziału min < x < max spełniającą warunek
# x * (1 / x) != 1
# min - argument funkcji przyjmujący wartość minimalną przedziału
# max - argument funkcji przyjmujący wartość maksymalną przedziału
function numberFromTheRange(min, max)
    # x - liczba spełniająca podany warunek
    x = Float64(min)
    # y - liczba ograniczająca podany przedział z góry
    y = Float64(max)
    while x < y
        if x * (1 / x) != 1
            println(x)
            break
        end
        x = nextfloat(x)
    end
end
# przykładowe wywołania funkcji numberFromTheRange
numberFromTheRange(1.0, 2.0)   # 1.000000057228997
numberFromTheRange(nextfloat(-Inf), prevfloat(Inf))   # -1.7976931348623157e308
