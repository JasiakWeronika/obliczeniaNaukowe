# Weronika Jasiak
# Funkcja dostępna w języku Julia wyznaczająca epsilony maszynowe
# dla podanych typów zmiennopozycyjnych
eps(Float16)   # 0.000977
eps(Float32)   # 1.1920929e-7
eps(Float64)   # 2.220446049250313e-16
# Funkcja myEps wyznacza iteracyjnie epsilony maszynowe
# dla wszystkich dostępnych typów zmiennopozycyjnych
# Type - argument funkcji przyjmujący wartości typów
# zmiennopozycyjnych Float16, Float32, Float64
function myEps(Type)
    # eps - epsilon maszynowy
    eps = Type(1.0)
    while 1 + eps / 2 > 1
        eps /=  2
    end
    return eps
end
# przykładowe wywołania funkcji myEps
myEps(Float16)   # 0.000977
myEps(Float32)   # 1.1920929e-7
myEps(Float64)   # 2.220446049250313e-16
