

function problem_20(number::Int)::Int
    value = factorial(BigInt(number))
    return sum(parse(Int, c) for c in string(value))
end # function

# Benchmarks
# problem_20(100)  2.611 μs (21 allocations: 624 bytes)
