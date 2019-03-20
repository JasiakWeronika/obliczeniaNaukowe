# Weronika Jasiak
# Funkcja rozwiązuje równanie f(x)=0 metodą siecznych.
# f - zadana funkcja f(x) jako anonimowa funkcja
# x0, x1 - przybliżenia początkowe
# delta, epsilon - dokładności obliczeń
# maxit - maksymalna dopuszczalna liczba iteracji
function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    local r::Float64 # r - przybliżenie pierwiastka równania f(x0)=0
    local v::Float64 # v - wartość f(r)
    local u::Float64 # u - przybliżenie pierwiastka równania f(x1)=0
    local w::Float64 # w - wartość f(u)
    local it::Int # it - liczba wykonanych iteracji
    local err::Int # err - sygnalizacja błędu
    local t::Float64 # t-
    local s::Float64 # s -
    r = x0
    u = x1
    v = f(r)
    w = f(u)
    it = 0
    err = 0
    for it in range(1, maxit)
        if v > w
            # r <-> u
            t = r
            r = u
            u = t
            # v <-> w
            t = v
            v = w
            w = t
        end
        s = (u - r) / (w - v)
        u = r
        w = v
        r -= v * s
        v = f(r)
        if abs(v) < epsilon || abs(u - r) < delta
            return (r, v, it, err)
        end
    end
    if abs(v) > epsilon && abs(u - r) > delta
        err = 1
    end
    return (r, v, it, err)
end
