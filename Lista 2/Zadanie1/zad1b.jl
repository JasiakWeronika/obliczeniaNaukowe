# Weronika Jasiak
# Funkcja backward oblicza sumę iloczynów x(i) i y(i), dla i = 5, 4, ..., 1
# Type - argument funkcji przyjmujący wartości typów
# zmiennopozycyjnych Float32, Float64
function backward(Type)
    # n - wartość od której następuje iteracja pętli
    n = 5
    # x - tablica wartości jakie przyjmuje x(i) dla i = 5, 4, ..., 1
    x = Type[2.718281828, -3.141592654, 1.414213562, 0.577215664, 0.301029995]
    # y - tablica wartości jakie przyjmuje x(i) i = 5, 4, ..., 1
    y = Type[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]
    # S - suma iloczynów skalarnych dwóch wektorów
    S = Type(0.0)
    i = n
    while i != 0
        S += Type(x[i] * y[i])
        i -= 1
    end
    println("'w tył' $S dla $Type")
end
# przykładowe wywołania funkcji backward
backward(Float32)   # -0.4543457              # poprzedni -0.4543457
backward(Float64)   # -0.004296342998713953   # poprzedni -1.5643308870494366e-10
