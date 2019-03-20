# Weronika Jasiak
# Funkcja distributionOfNumbersInTheRange wypisuje liczby
# zmiennopozycyjne w arytmetyce Float64 zapisane w systemie binarnym
# pozwalając sprawdzić czy są one równomiernie rozłożone w podanym
# przedziale korzystając z równania
# x = 1 + k * delta, gdzie k = 1, 2, ..., 2^52 - 1 oraz delta = 2^(-52)
# min - argument funkcji przyjmujący wartość minimalną przedziału
# max - argument funkcji przyjmujący wartość maksymalną przedziału
function distributionOfNumbersInTheRange(min, max)
    # x - wartość minimalna przedziału w arytmetyce zmiennopozycyjnej
    # Float64
    x = Float64(min)
    # y - wartość maksymalna przedziału w arytmetyce zmiennopozycyjnej
    # Float64
    y = Float64(max)
    # delta - stała przyjmująca wartość 2^(-52)
    delta = Float64(2.0)^(-52)
    # k - zmienna przyjmująca wartości z przedziału [1, 2^52 -1]
    k = 1
    while k <= 3
        println("$x + $k * delta     $(bits(x + k * delta))")
        k += 1
    end
    println("...")
    #k -= 1
    #while k > 0 && k <= 3
    #    println("$y - $k * delta     $(bits(y - k * delta))")
    #    k -= 1
    #end
end
# przykładowe wywołania funkcji distributionOfNumbersInTheRange
distributionOfNumbersInTheRange(1.0, 2.0)
# 1.0 + 1 * delta     0011111111110000000000000000000000000000000000000000000000000001
# 1.0 + 2 * delta     0011111111110000000000000000000000000000000000000000000000000010
# 1.0 + 3 * delta     0011111111110000000000000000000000000000000000000000000000000011
# ...
distributionOfNumbersInTheRange(0.5, 1.0)
# 0.5 + 1 * delta     0011111111100000000000000000000000000000000000000000000000000010
# 0.5 + 2 * delta     0011111111100000000000000000000000000000000000000000000000000100
# 0.5 + 3 * delta     0011111111100000000000000000000000000000000000000000000000000110
# ...
# dla delty = 2^(-53)
# 0.5 + 1 * delta     0011111111100000000000000000000000000000000000000000000000000001
# 0.5 + 2 * delta     0011111111100000000000000000000000000000000000000000000000000010
# 0.5 + 3 * delta     0011111111100000000000000000000000000000000000000000000000000011
# ...
distributionOfNumbersInTheRange(2.0, 4.0)
# 2.0 + 1 * delta     0100000000000000000000000000000000000000000000000000000000000000
# 2.0 + 2 * delta     0100000000000000000000000000000000000000000000000000000000000000
# 2.0 + 3 * delta     0100000000000000000000000000000000000000000000000000000000000010
# ...
# dla delty = 2^(-51)
# 2.0 + 1 * delta     0100000000000000000000000000000000000000000000000000000000000001
# 2.0 + 2 * delta     0100000000000000000000000000000000000000000000000000000000000010
# 2.0 + 3 * delta     0100000000000000000000000000000000000000000000000000000000000011
# ...
