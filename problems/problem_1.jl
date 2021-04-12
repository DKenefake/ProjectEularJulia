#C style
function problem_1(upper::Int)
    local accum = 0
    for i ∈ 1:upper
        if i % 3 == 0 || i % 5 == 0
            accum += i
        end
    end
    return accum
end # function


# solve the problem with functional programming
function problem_1_fp(upper::Int)
    return sum(filter(i -> i%3 == 0 || i %5 == 0, 1:upper))
end

#solve the problem with exact expressions
function problem_1_math(upper::Int)
    sum_until = i -> div(i *(i+1), 2)
    return 3*sum_until(div(upper,3)) + 5*sum_until(div(upper,5)) - 15*sum_until(div(upper,15))
end


# Simple typiming resutls
# problem_1(999)           2.078 μs (0 allocations: 0 bytes)
# problem_1_fp(999)        1.430 μs (2 allocations: 11.75 KiB)
# problem_1_math(999)      0.001 ns (0 allocations: 0 bytes)   <-- Compiled away!
