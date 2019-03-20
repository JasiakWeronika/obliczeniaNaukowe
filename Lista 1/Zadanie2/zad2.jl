# Weronika Jasiak
# Funkcja khanEps wyznacza epsilon maszynowy według Kahana
# dla wszystkich dostępnych typów zmiennopozycyjnych
# Type - argument funkcji przyjmujący wartości typów
# zmiennopozycyjnych Float16, Float32, Float64
function khanEps(Type)
    return Type(3) * ((Type(4) / Type(3)) - Type(1)) - Type(1)
end
# przykładowe wywołania funkcji khanEps
khanEps(Float16)   # -0.000977
khanEps(Float32)   # 1.1920929e-7
khanEps(Float64)   # -2.220446049250313e-16
