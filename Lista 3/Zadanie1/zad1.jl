# Weronika Jasiak
# Funkcja rozwiązuje równanie f(x)=0 metodą bisekcji.
# f - zadana funkcja f(x) jako anonimowa funkcja
# a, b - końce przedziału początkowego
# delta, epsilon - dokładności obliczeń
function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
    local r::Float64 # r - przybliżenie pierwiastka równania f(x)=0
    local v::Float64 # v - wartość f(r)
    local it::Int # it - liczba wykonanych iteracji
    local err::Int # err - sygnalizacja błędu
    local u::Float64 # u - wartość f(a)
    local w::Float64 # w - wartość f(b)
    local e::Float64 # e - oszacowanie błędu
    r = 0
    v = 0
    it = 0
    err = 0
    u = f(a)
    w = f(b)
    e = b - a
    if sign(u) == sign(w)
        err = 1
        return (r, v, it, err)
    end
    while e > epsilon
        it += 1
        e /= 2.0
        r = a + e
        v = f(r)
        if abs(e) < delta || abs(v) < epsilon
            return (r, v, it, err)
        end
        if sign(v) != sign(u)
            b = r
            w = v
        else
            a = r
            u = v
        end
    end
    return (r, v, it, err)
end
