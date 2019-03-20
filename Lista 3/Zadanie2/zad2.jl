# Weronika Jasiak
# Funkcja rozwiązuje równanie f(x)=0 metodą Newtona.
# f, pf - zadana funkcja f(x) i odpowiednio jej pochodna f'(x) jako anonimowe funkcje
# x0 - przybliżenie początkowe
# delta, epsilon - dokładności obliczeń
# maxit - maksymalna dopuszczalna liczba iteracji
function mstycznych(f, pf, x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    local r::Float64 # r - przybliżenie pierwiastka równania f(x0)=0
    local v::Float64 # v - wartość f(r)
    local it::Int # it - liczba wykonanych iteracji
    local err::Int # err - sygnalizacja błędu
    local x1::Float64 # x1 -
    r = x0
    v = f(r)
    it = 0
    err = 0
    if abs(v) < epsilon
        err = 2
        return (r, v, it, err)
    end
    for it in range(1, maxit)
        x1 = r - (v / pf(r))
        v = f(x1)
        if abs(x1 - r) < delta || abs(v) < epsilon
            return (r, v, it, err)
        end
        r = x1
    end
    if abs(v) > epsilon
        err = 1
    end
    return (r, v, it, err)
end
