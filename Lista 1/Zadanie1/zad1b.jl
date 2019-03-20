# Weronika Jasiak
# Funkcja dostępna w języku Julia zwracająca najmniejszą liczbę eta
# dla podanych typów zmiennopozycyjnych taką, że x < eta,
# jeśli nie ma takiego y, to zwraca eta.
nextfloat(Float16(0.0))   # 6.00e-8
nextfloat(Float32(0.0))   # 1.00e-45
nextfloat(Float64(0.0))   # 4.94e-324
# Funkcja myNextFloat wyznacza iteracyjnie liczbę eta taką,
# że eta > 0.0 dla wszystkich dostępnych typów zmiennopozycyjnych
# Type - argument funkcji przyjmujący wartości typów
# zmiennopozycyjnych Float16, Float32, Float64
function myNextFloat(Type)
    # eta - liczba eta
    eta = Type(1.0)
    while eta / 2 > 0
        eta /= 2
    end
    return eta
end
# przykładowe wywołania funkcji myNextFloat
myNextFloat(Float16)   # 6.00e-8
myNextFloat(Float32)   # 1.00e-45
myNextFloat(Float64)   # 4.94e-324
