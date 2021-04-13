
# C Style
function problem_16(power::Int)::Int
    value = BigInt(2)^BigInt(power)
    return sum(parse(Int, c) for c in string(value))
end # function

# Benchmarks
# problem_16(1000)  3.957 μs (19 allocations: 792 bytes)
