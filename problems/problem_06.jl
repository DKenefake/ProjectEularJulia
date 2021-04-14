# C Style
function problem_6(number::Int)::Int

    sum_of_numbers = 0
    sum_of_sqaures = 0

    for i ∈ 1:number
        sum_of_numbers += i
        sum_of_sqaures += i*i
    end

    return sum_of_numbers^2 - sum_of_sqaures
end # function

# functional programming style
function problem_6_fp(number::Int)::Int
    return sum(1:number)^2 - sum(map(i-> i*i, 1:number))
end # function

#exact evaluation
function problem_6_math(number::Int)::Int

    sum_of_numbers = i -> div(i*(i+1), 2)
    sum_of_sqaures = i -> div(i*(i+1)*(2*i+1), 6)

    return  sum_of_numbers(number)^2 - sum_of_sqaures(number)
end

# Benchmarks
# problem_6(100)            1.100 ns (0 allocations: 0 bytes)   <-- Compiled Away!
# problem_6_fp(100)         73.463 ns (1 allocation: 896 bytes)
# problem_6_math(100)       0.001 ns (0 allocations: 0 bytes)   <-- Compiled Away!
