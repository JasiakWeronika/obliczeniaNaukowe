# Weronika Jasiak
# Funkcja ascending oblicza sumę iloczynów x(i) i y(i),
# dla i = 1, 2, ..., 5 w kolejności od najmniejszego do największego
# (dodaje dodatnie liczby w porządku od najmniejszego do największego,
# dodaje ujemne liczby w porządku od największego do najmniejszego,
# a następnie dodaje obliczone wcześniej sumy częściowe)
# Type - argument funkcji przyjmujący wartości typów
# zmiennopozycyjnych Float32, Float64
function ascending(Type)
    # n - wartość do której następuje iteracja pętli
    n = 5
    # x - tablica wartości jakie przyjmuje x(i) dla i = 1, 2, ..., 5
    x = Type[2.718281828, -3.141592654, 1.414213562, 0.5772156649, 0.3010299957]
    # y - tablica wartości jakie przyjmuje x(i) dla i = 1, 2, ..., 5
    y = Type[1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049]
    # product - tablica zawierająca produkty iloczynu wektorów x(i) i y(i)
    # dla i = 1, 2, ..., 5
    product = Type[]
    for i = 1 : n
        push!(product, (x[i] * y[i]))
    end
    sort!(product)
    # positiveS - suma wszystkich dodatnich produktów w kolejności od
    # najmniejszego do największego
    positiveS = Type(0.0)
    for i = 1 : n
        if product[i] > 0
            positiveS += product[i]
        end
    end
    sort(product, rev = true)
    # negativeS - suma wszystkich ujemnych produktów w kolejności od
    # największego do najmniejszego
    negativeS = Type(0.0)
    for i = 1 : n
        if product[i] < 0
            negativeS += product[i]
        end
    end
    # S - suma sum częściowych
    S = positiveS + negativeS
    println("rosnąco $S dla $Type")
end
# przykładowe wywołania funkcji ascending
ascending(Float32)   # -0.5
ascending(Float64)   # 0.0
