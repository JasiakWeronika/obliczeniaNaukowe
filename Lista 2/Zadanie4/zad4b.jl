# Weronika Jasiak
# Korzystajac z pakietu Polynomials zostają obliczone pierwiastki
# wielomianu oraz błędy dla zmienionych danych.
using Polynomials
# p - współczynniki wielomianu
p = [1, -210.0-(1/(2^(23))), 20615.0,-1256850.0,
      53327946.0, -1672280820.0, 40171771630.0, -756111184500.0,
      11310276995381.0, -135585182899530.0,
      1307535010540395.0, -10142299865511450.0,
      63030812099294896.0, -311333643161390640.0,
      1206647803780373360.0, -3599979517947607200.0,
      8037811822645051776.0, -12870931245150988800.0,
      13803759753640704000.0, -8752948036761600000.0,
      2432902008176640000.0]
# liczby - miejsca zerowe funkcji
liczby = [20.0, 19.0, 18.0, 17.0, 16.0, 15.0, 14.0, 13.0, 12.0, 11.0,
            10.0, 9.0, 8.0, 7.0, 6.0, 5.0, 4.0, 3.0, 2.0, 1.0]
# p - odwrócona tablica współczynników wielomianu
p = reverse(p)
# pierwiastki - obliczone pierwiastki wielomianu p
pierwiastki = roots(Polynomials.Poly(p))
println("z")
for i in range(1, 20)
      println("$(pierwiastki[i])")
end
println("|P(z)|")
for i in range(1, 20)
      println("$(abs(polyval(Polynomials.Poly(p), pierwiastki[i])))")
end
println("|p(z)|")
for i in range(1, 20)
      println("$(abs(polyval(Polynomials.poly(liczby), pierwiastki[i])))")
end
println("|z-k|")
for i in range(1, 20)
      println("$(abs(pierwiastki[i] - liczby[i]))")
end
