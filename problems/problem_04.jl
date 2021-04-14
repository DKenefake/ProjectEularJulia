
function is_palendrome(number::Int)::Bool

    # negative numbers can't be palendromes
    if number < 0
        return false
    end

    #numbers that are one digit are always palendromes
    if number < 10
        return true
    end

    # numbers that end with 0 are never palendromes
    if number % 10 == 0
        return false
    end

    rev = 0
    x = number

    while x > rev
        rev = rev * 10 + x % 10
        x = div(x, 10)
    end

    return x == rev || div(x, 10) == rev
end

# C Style brout force solution
function problem_4(number::Int)::Int

    lower_bound = 10^(number -1)
    upper_bound = 10^(number)-1
    sol = -1

    for i ∈ lower_bound:upper_bound
        for j ∈ lower_bound:upper_bound
            prod = i*j
            if is_palendrome(prod) && prod > sol
                sol = prod
            end
        end
    end

    return sol
end
