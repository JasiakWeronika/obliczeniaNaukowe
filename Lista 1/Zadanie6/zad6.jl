# Weronika Jasiak
# Funkcja calculatingTheValueOfTheFunction wyznacza wartości funkcji
# f(x) = sqrt(x^2 + 1) - 1 i  funkcji g(x) = x^2 / (sqrt(x^2 + 1) + 1),
# gdzie x = 8^(-1), x = 8^(-2), x = 8^(-2), ...
# max - argument funkcji przyjmujący wartość maksymalną iteracji
function calculatingTheValueOfTheFunction(max)
    # n - wartość maksymalan iteracji zapisana w arytmetyce
    # zmiennopozycyjnej Float64
    n = Float64(max)
    for i = 1 : n
        # f - wzór funkcji f(x)
        f = sqrt((8^(-i))^2.0 + 1.0) - 1.0
        # g - wzór funkcji g(x)
        g = (8^(-i))^2 / (sqrt((8^(-i))^2.0 + 1.0) + 1.0)
        println("i = $i \t\t f(x) = $f \t\t g(x) = $g")
    end
end
# przykładowe wywołania funkcji calculatingTheValueOfTheFunction
calculatingTheValueOfTheFunction(10)
# i = 1.0          f(x) = 0.0077822185373186414        g(x) = 0.0077822185373187065
# i = 2.0          f(x) = 0.00012206286282867573       g(x) = 0.00012206286282875901
# i = 3.0          f(x) = 1.9073468138230965e-6        g(x) = 1.907346813826566e-6
# i = 4.0          f(x) = 2.9802321943606103e-8        g(x) = 2.9802321943606116e-8
# i = 5.0          f(x) = 4.656612873077393e-10        g(x) = 4.6566128719931904e-10
# i = 6.0          f(x) = 7.275957614183426e-12        g(x) = 7.275957614156956e-12
# i = 7.0          f(x) = 1.1368683772161603e-13       g(x) = 1.1368683772160957e-13
# i = 8.0          f(x) = 1.7763568394002505e-15       g(x) = 1.7763568394002489e-15
# i = 9.0          f(x) = 0.0                          g(x) = 2.7755575615628914e-17
# i = 10.0         f(x) = 0.0                          g(x) = 4.336808689942018e-19
