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
    lower_factors = filter(i-> number % i == 0, 1:upper_bound)
    upper_factors = map(i-> div(number , i), lower_factors)
    return maximum(filter(is_prime, lower_factors ∪ upper_factors))
end
