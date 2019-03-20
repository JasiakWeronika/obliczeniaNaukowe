# Weronika Jasiak
# Funkcja descending oblicza sumę iloczynów x(i) i y(i),
# dla i = 1, 2, ..., 5 w kolejności od największego do najmniejszego
# (dodaje dodatnie liczby w porządku od największego do najmniejszego,
# dodaje ujemne liczby w porządku od najmniejszego do największego,
# a następnie dodaje obliczone wcześniej sumy częściowe)
# Type - argument funkcji przyjmujący wartości typów
# zmiennopozycyjnych Float32, Float64
function descending(Type)
    # n - wartość do której następuje iteracja pętli
    n = 5
    # x - tablica wartości jakie przyjmuje x(i) dla i = 1, 2, ..., 5
    x = Type[2.718281828, -3.141592654, 1.414213562, 0.577215664, 0.301029995]
    # y - tablica wartości jakie przyjmuje x(i) dla i = 1, 2, ..., 5
    y = Type[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]
    # product - tablica zawierająca produkty iloczynu wektorów x(i) i y(i)
    # dla i = 1, 2, ..., 5
    product = Type[]
    for i = 1 : n
        push!(product, (x[i] * y[i]))
    end
    sort!(product, rev = true)
    # positiveS - suma wszystkich dodatnich produktów w kolejności od
    # największego do najmniejszego
    positiveS = Type(0.0)
    for i = 1 : n
        if product[i] > 0
            positiveS += product[i]
        end
    end
    sort(product)
    # negativeS - suma wszystkich ujemnych produktów w kolejności od
    # najmniejszego do największego
    negativeS = Type(0.0)
    for i = 1 : n
        if product[i] < 0
            negativeS += product[i]
        end
    end
    # S - suma sum częściowych
    S = positiveS + negativeS
    println("malejąco $S dla $Type")
end
# przykładowe wywołania funkcji descending
descending(Float32)   # -0.5                    # poprzedni -0.5
descending(Float64)   # -0.004296342842280865   # poprzedni 0.0
