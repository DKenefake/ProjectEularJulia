

function is_prime(number::Int)::Bool

    if number <= 0
        return false
    end

    if number == 1
        return false
    end

    if number == 2
        return true
    end

    if number % 2 == 0
        return false
    end

    upper_bound = isqrt(number)+1

    return all(i-> number % i != 0, 3:2:upper_bound)
end

# C Style Brute Force
function problem_27(number::Int)

    a_best, b_best = 0,0
    val_best = -1

    for a ∈ -number:number
        for b ∈ -number:number

            f_ab = n -> n*n + a*n + b
            val = 0
            while is_prime(f_ab(val))
                val += 1
            end

            if val > val_best
                a_best, b_best = a, b
                val_best = val
            end
        end
    end
    return a_best*b_best
end # function

# informed algorithm, this is BAD CODE
function problem_27_informed(number::Int)

    f = (n, a, b) -> n*n + a*n + b
    a_best, b_best = 0,0
    val_best = 3

    primes = filter(i->is_prime(i), 2:number)

    for a ∈ -primes∪primes
        for b ∈ primes

            f_ab = n -> n*n + a*n + b

            # check if the best position is a prime
            # this must be true for this to be viable

            if !is_prime(f_ab(val_best))
                continue
            end

            val = 0

            while is_prime(f_ab(val))
                val += 1
            end

            if val > val_best
                a_best, b_best = a, b
                val_best = val
            end
        end
    end
    return a_best*b_best
end

# Benchmarks
# problem_27(1000)           53.162 ms (0 allocations: 0 bytes)
# problem_27_informed         3.812 ms (25 allocations: 32.39 KiB)
