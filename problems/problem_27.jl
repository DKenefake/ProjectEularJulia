

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
    val_best = -1

    prime_list = filter(is_prime, 1:number)

    prime_indices = 1:100

    for a ∈ prime_list
        for b ∈ prime_list

            #positive branch a > 0, b> 0
            val = 0
            while is_prime(val*val + a*val + b)
                val += 1
            end

            if val > val_best
                a_best, b_best = a, b
                val_best = val
            end

            #positive branch a > 0, b> 0
            val = 0
            while is_prime(val*val + -a*val + b)
                val += 1
            end

            if val > val_best
                a_best, b_best = -a, b
                val_best = val
            end
        end
    end
    return a_best*b_best
end

# Benchmarks
# problem_27(100)           53.162 ms (0 allocations: 0 bytes)
# problem_27_informed        5.249 ms (2 allocations: 9.39 KiB)
