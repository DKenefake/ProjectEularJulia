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


# functional programming approach
function problem_3_fp(number::Int)::Int
    upper_bound = isqrt(number)+1
    lower_factors = filter(i-> number % i == 0, 3:2:upper_bound)
    upper_factors = map(i-> div(number , i), lower_factors)
    return maximum(filter(is_prime, lower_factors ∪ upper_factors))
end

# better algorithm modified from https://stackoverflow.com/questions/14138053/project-euler-3-with-python-most-efficient-method
function problem_3_algo(number::Int)::Int

    while number % 2 == 0
        number = div(number, 2)
    end

    i = 3

    while i*i <= number
        while number % i == 0
            number = div(number, i)
        end

        i = i+2
    end
    return number
end

# Benchmarks
# problem_3_fp(600851475143)        2.681 ms (17 allocations: 2.96 MiB)
# problem_3_algo(600851475143)      3.500 μs (0 allocations: 0 bytes)
