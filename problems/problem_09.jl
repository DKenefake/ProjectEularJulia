
# C Style brute force
function problem_9(number::Int)::Int

    for i ∈ 1:(div(number,2))
        for j ∈ (i+1):(number-i)
            k = number - i - j
            if i^2 + j^2 == k^2
                if i + j + k == number
                    return i*j*k
                end
            end
        end
    end
    return -1
end

# C Style not brute force from https://www.mathblog.dk/pythagorean-triplets/
function problem_9_informed(number::Int)::Int
    a, b, c = 0, 0, 0
    s = number
    m, k, n, d = 0, 0, 0, 0

    limit = isqrt(div(s, 2))

    for m ∈ 2:limit
        if div(s, 2)% m == 0
            if m %2 == 0
                k = m+1
            else
                k = m + 2
            end
            while k < 2*m && k <= div(s, 2*m)
                if div(s, 2*m) % k == 0 && gcd(k,m) == 1
                    d = div(div(s, 2), k*m)
                    n = k - m
                    a = d*(m*m-n*n)
                    b = 2*d*n*m
                    c = d*(m*m+n*n)
                    return a*b*c
                end
                k += 2
            end
        end
    end

    return -1

end # function

# Benchmarks
# problem_9(1000)               107.400 μs (0 allocations: 0 bytes)
# problem_9_informed(1000)      35.815 ns (0 allocations: 0 bytes)
