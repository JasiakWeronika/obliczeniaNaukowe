# Weronika Jasiak
# Funkcja forward oblicza sumę iloczynów x(i) i y(i), dla i = 1, 2, ..., 5
# Type - argument funkcji przyjmujący wartości typów
# zmiennopozycyjnych Float32, Float64
function forward(Type)
    # n - wartość do której następuje iteracja pętli
    n = 5
    # x - tablica wartości jakie przyjmuje x(i) dla i = 1, 2, ..., 5
    x = Type[2.718281828, -3.141592654, 1.414213562, 0.577215664, 0.301029995]
    # y - tablica wartości jakie przyjmuje x(i) dla i = 1, 2, ..., 5
    y = Type[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]
    # S - suma iloczynów skalarnych dwóch wektorów
    S = Type(0.0)
    for i = 1 : n
        S += Type(x[i] * y[i])
    end
    println("'w przód' $S dla $Type")
end
# przykładowe wywołania funkcji forward
forward(Float32)   # -0.4999443              # poprzedni -0.4999443
forward(Float64)   # -0.004296342739891585   # poprzedni 1.0251881368296672e-10
